class ArticlesController < ApplicationController

  def publish
    @article = Article.find(params[:id])

    @article.update_attribute(:published, true)
    @article.community.update(user_id: nil)
    flash.notice = "Article '#{@article.title}' is about to be post, you can not modify it after !"

    redirect_to @article
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @community = Community.find(params[:community_id])
  end

  def create
    community = Community.find(params[:community_id])
    article = current_user.articles.build(article_params)
    article.community = community
    article.save
    redirect_to user_path(current_user)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to action:  'index'
  end

  def edit
    @article = Article.find(params[:id])
    @community = Community.find(params[:community_id])
  end

  def update
    user = current_user
    @article = Article.find(params[:id])
    @article.update_attributes(article_params)
    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to user_path(user)
  end

  private
  def article_params
      params.require(:article).permit(:title, :content)
  end
end
