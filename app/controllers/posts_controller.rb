class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :new, :create]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    authorize @post, policy_class: PostPolicy
  end

  def create
    @post = current_user.posts.build(post_params)
    authorize @post

    if @post.save
      redirect_to posts_path, notice: 'Post creado exitosamente.'
    else
      render :new
    end
  end

  def edit
    authorize @post, policy_class: PostPolicy
  end

  def update
    authorize @post, policy_class: PostPolicy

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    authorize @post, policy_class: PostPolicy
    @post.destroy

    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :published_at)
  end
end
