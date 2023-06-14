class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            # logs the user in
            session[:user_id] = @user.id
            redirect_to user_path(@user), notice: "Thanks for signing up!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @user = find_user
    end

    def edit
        @user = find_user
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            # redirect to show view and displays message for user
            redirect_to user_path(@user), notice: "Profile successfully updated!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        find_user.destroy
        session[:user_id] = nil
        redirect_to movies_path, status: :see_other, alert: "Profile successfully deleted!"
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end

    def find_user
        User.find(params[:id])
    end 
end
