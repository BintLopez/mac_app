class UsersControllerController < ApplicationController
  before_action :authenticate_user!

end
