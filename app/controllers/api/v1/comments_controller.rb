class Api::V1::CommentsController < ApplicationController
  before_action :set_current_post
  before_action :set_comment, only: %i[show update destroy]
  before_action :authenticate_user
  before_action :authenticate_comment_ownership, only: %i[update destroy]

  def index
    render json: @current_post.comments
  end

  def create
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.post = @current_post
    if comment.save
      render json: comment
    else
      render json: { errors: comment.errors.full_messages }
    end
  end

  def show
    render json: @comment
  end

  def update
    if @comment.update!(comment_params)
      render json: @comment
    else
      render json: { errors: @comment.errors.full_messages }
    end
  end

  def destroy
    @comment.destroy
    render json: { errors: 'Comment deleted successfuly!' }
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_current_post
    @current_post = Post.find_by(id: params[:post_id])
    render json: { errors: 'Post not found' } unless @current_post
  end

  def set_comment
    @comment = Comment.find(params[:id])
    render json: { errors: 'comment not found' } unless @comment
  end

  def authenticate_comment_ownership
    unless @comment.user == current_user
      render json: { errors: 'Only comment author can edit/delete the comment.' }
    end
  end
end
