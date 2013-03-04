class CommentsController < ApplicationController

before_filter :authenticate_user!, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    @comment.user = current_user
    if @comment.save
   	 redirect_to post_path(@post), notice: 'Comment was successfully created.'
   	else
   		
   	  redirect_to post_path(@post)
   	end
  end

  def like
    @comment = Comment.find(params[:comment_id].to_i)
    current_user.like!(@comment)
    redirect_to post_path(@comment.post)
  end

  # Unlike a post
  def unlike
    @post = Comment.find(params[:comment_id].to_i)
    current_user.unlike!(@comment)
    redirect_to post_path(@comment.post)
  end

end
