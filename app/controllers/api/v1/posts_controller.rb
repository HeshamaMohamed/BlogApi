class Api::V1::PostsController < ApplicationController
  before_action :authenticate_user
  before_action :authorize_post_author, only: %i[update destroy]
  before_action :set_post, only: %i[show update destroy]

  def index
    posts = Post.all
    if posts.empty?
      render json: { errors: 'There are no posts created yet.' }, status: :no_content
    else
      render json: { posts: posts }
    end
  end

  def create
    post = Post.new(post_params)
    post.user = @current_user
    post.tags = tags_from_params

    if post.save
      render json: post
    else
      render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @post
  end

  def update
    if @post.update!(post_params)
      render json: { 'Modified!': @post }
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    render json: { message: 'Post deleted successfuly!' }
  end

  private

  def post_params
    params.permit(:title, :body)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
    render json: { errors: 'Post not found' }, status: :not_found unless @post
  end

  def tags_from_params
    tags_names = params.require(:post).permit(tags: [])[:tags]
    tags_names.map! do |tag_name|
      Tag.find_by(name: tag_name) || Tag.create(name: tag_name)
    end
  end

  def authorize_post_author
    unless @post.user == @current_user
      render json: { errors: 'Only post author can edit/delete the post.' }, status: :forbidden
    end
  end
end
