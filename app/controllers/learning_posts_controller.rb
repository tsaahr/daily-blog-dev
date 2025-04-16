class LearningPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_learning_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]


  def index
    @learning_posts = LearningPost.where(public: true).order(created_at: :desc)
  end

  def show
    if !@learning_post.public && @learning_post.user != current_user
      redirect_to learning_posts_path, alert: "Você não tem permissão para ver esse post."
    end
  end

  def new
    @learning_post = current_user.learning_posts.new
  end

  def create
    @learning_post = current_user.learning_posts.new(learning_post_params)
    if @learning_post.save
      redirect_to @learning_post, notice: "Post criado com sucesso."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @learning_post.update(learning_post_params)
      redirect_to @learning_post, notice: "Post atualizado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @learning_post.destroy
    redirect_to my_posts_learning_posts_path, notice: "Post excluído com sucesso."
  end

  def my_posts
    @learning_posts = current_user.learning_posts.order(created_at: :desc)
  end

  private

  def set_learning_post
    @learning_post = LearningPost.find(params[:id])
  end

  def authorize_user!
    redirect_to learning_posts_path, alert: "Sem permissão." unless @learning_post.user == current_user
  end

  def learning_post_params
    params.require(:learning_post).permit(:title, :content, :public, :tag_list)
  end
end
