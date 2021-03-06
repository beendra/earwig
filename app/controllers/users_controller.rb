class UsersController < ApplicationController

    skip_before_action :authorized, only: [:login, :handle_login, :new,:create]


    def index 
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create 
        
        user = User.create(user_params)
        redirect_to user_path(user)
    end

    def show
        # @user = User.find(params[:id])
        @user = User.find(@current_user.id)
        @favorite = @user.my_faves
        @reviewed = @user.reviewed
    end

    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        # if 
        @user.update(user_params)
        #   flash[:success] = "Object was successfully updated"
        #   redirect_to @user
        # else
        #   flash[:error] = "Something went wrong"
        #   render 'edit'
        # end
        redirect_to user_path(@user)
    end

    def login
    end

    def handle_login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
        redirect_to '/'
        else
            redirect_to login_path
        end
    end

    def logout
        session[:user_id] = nil
        redirect_to login_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email, :image)
    end

end
