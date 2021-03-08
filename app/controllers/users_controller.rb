class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create 
        user = User.create(user_params)
        redirect_to user_path(user)
    end

    def show
        @user = User.find(params[:id])
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
    

    private

    def user_params
        params.require(:user).permit(:username, :password, :email)
    end

end
