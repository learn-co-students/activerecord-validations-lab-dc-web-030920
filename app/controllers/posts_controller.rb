class PostsController < ApplicationController

    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def create
        @post = Post.new(post_params)
        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            render :new
        end
    end


    private

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :summary, :category)
    end

end

