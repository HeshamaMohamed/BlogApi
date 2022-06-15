class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_user
  before_action :set_comment, only: %i[show update destroy]
  before_action :authorize_comment_owner, only: %i[update destroy]

  def index
    comments = Comment.where(post_params)
    if comments.empty?
      render json: { errors: 'There are no comments created yet for this post.' }, status: :no_content
    else
      render json: { comments: comments }
    end
  end

  def create
    comment = build_comment
    if comment.save
      render json: comment
    else
      render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @comment
  end

  def update
    if @comment.update(comment_params)
      render json: { 'Modified!': @comment }
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    render json: { message: 'Comment deleted successfuly!' }
  end

  private

  def comment_params
    params.permit(:body)
  end

  def post_params
    params.permit(:post_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
    render json: { errors: 'comment not found' }, status: :not_found unless @comment
  end

  def build_comment
    post = Post.find(post_params[:post_id])
    Comment.new(body: comment_params[:body], user: @current_user, post: post)
  end

  def authorize_comment_owner
    unless @comment.user == @current_user
      render json: { errors: 'Only comment author can edit/delete the comment.' }, status: :forbidden
    end
  end
end
