class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @posts = @user.posts.order(created_at: :desc)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to user_path(@user), notice: "ユーザーを作成しました"
        else
            render :new, status: :unprocessable_entity, alert: "ユーザーの作成に失敗しました"
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
