class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]
  before_action :authenticate_user
  before_action :authenticate_post_ownership, only: %i[update destroy]

  def index
    posts = Post.all.includes(:tags)
    posts = posts.map do |post|
      tags = { tags: post.tags.map(&:name) }
      post = post.as_json.merge(tags)
    end
    render json: posts
  end

  def create
    post = Post.new(post_params)
    @post.user = current_user
    @post.tags = tags_from_params

    if post.save
      render json: post
    else
      render json: { errors: post.errors.full_messages }
    end
  end

  def show
    tags = {tags: @post.tags.map(&:name) }
    post = @post.as_json.merge(tags)
    render json: post
  end

  def update
    if @post.update!(post_params)
      render json: post
    else
      render json: { errors: @post.errors.full_messages }
    end
  end

  def destroy
    @post.destroy
    render json: { errors: 'Post deleted successfuly!' }
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
    render json: { errors: 'Post not found' } unless @post
  end

  def tags_from_params
    tags_names = params.require(:post).permit(tags: [])[:tags]
    tags_names.map! do |tag_name|
      Tag.find_by(name: tag_name) || Tag.create(name: tag_name)
    end
  end

  def authenticate_post_ownership
    unless @post.user == current_user
      render json: { errors: 'Only post author can edit/delete the post.' }
    end
  end
end
