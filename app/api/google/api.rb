module Google
  class API < Grape::API

    desc 'Google Authentication'
    get :oauth2callback do
      "It worked!"
    end

  end
end
