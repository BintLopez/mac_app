class User < ActiveRecord::Base
  ROLES = [
    ADMIN        = 'admin',
    BOARD_MEMBER = 'board_member',
    COORDINATOR  = 'coordinator',
    VOLUNTEER    = 'volunteer',
  ]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  attr_accessor :name

  has_one :person
  has_many :addresses, as: :addressable
  has_many :reimbursement_requests

  validates :role, inclusion: { in: ROLES }

  delegate :address, to: :person

  def self.find_for_google_oauth2(auth)
    user               = User.find_or_create_by(email: auth.info['email']) do |user|
      user.email    = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.save!
    end
    user.access_token  = auth.credentials.token
    user.refresh_token = auth.credentials.refresh_token
    user.save!
    user
  end


  ROLES.each do |role|
    define_method "#{role}?" do
      self.role == role
    end
  end
end
