class ArticlesController < ApplicationController

def index
  @articles = Article.all
end

def show
  @article = Article.find(params[:id])
end

def new
  @community = Community.find(params[:community_id])
  if current_user.articles.last == nil
    @article = Article.new
  else
    @article = current_user.articles.last
  end
end

def create
  community = Community.find(params[:community_id])
  article = current_user.articles.build(article_params)
  article.community = community
  article.save
  redirect_to user_path(user)
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
  redirect_to action:  'index'
end

def edit
  @article = Article.find(params[:id])
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
