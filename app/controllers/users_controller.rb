class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        @users = User.order(created_at: :asc)
    end
end
