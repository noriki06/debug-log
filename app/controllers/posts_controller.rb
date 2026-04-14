class PostsController < ApplicationController
    before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

    def index
        @posts = Post.all.order(created_at: :desc)
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)

        if @post.save
            redirect_to post_path(@post), notice: "投稿を作成しました"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path, notice: "投稿を削除しました"
    end

    private

    def post_params
        params.require(:post).permit(:title, :body)
    end
end
