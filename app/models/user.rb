class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable, omniauth_providers: [:google_oauth2]

  attr_accessor :name

  has_one :person
  has_many :addresses, as: :addressable

  def self.find_for_google_oauth2(auth)
    user = User.find_or_create_by(email: auth.info['email']) do |user|
      user.first_name = auth.info['first_name']
      user.last_name = auth.info['last_name']
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.save!
    end
    user.access_token = auth.credentials.token
    user.refresh_token = auth.credentials.refresh_token
    user.save!
    user
  end

  def create_volunteer_model
    if volunteer.nil?
      self.volunteer = Volunteer.new(user: self)
      save!
    end
  end

  def address
    return unless addresses.present?
    addresses.last
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
