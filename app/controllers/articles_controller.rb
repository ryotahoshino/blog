class ArticlesController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  def index
    @article = Article.order(created_at: :desc)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(post_params)
    if @article.save
      redirect_to @article, notice: '作成できました'
    else
      render :new, alert: '作成できませんでした'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: '更新できました'
    else
      render :edit, alert: '更新できませんでした'
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path, notice: '削除に成功しました'
    else
      redirect_to root_psth, alert: '削除できませんでした'
    end
  end

  private

  def find_post
    @article = Article.find(params[:id])
  end

  def article_params
  end
end
