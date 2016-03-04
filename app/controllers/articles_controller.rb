class ArticlesController < ApplicationController
  def new
    @article = Article.new(params[:id])
    @user = User.all
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :content))
    @article.user = current_user
    if @article.save
      redirect_to root_path
    else
      render :new
      @user = User.all
    end
  end

  def edit
    @articles = Article.find(params[:id])
    @user = User.all
  end
    
  def show
    @article = user.Article.find(params[:id])
    
  end

  def update
    @article = Article.find(params[:id])  
    if @article.update(params.require(:article).permit(:title, :content))
      redirect_to root_path
    else
      render :edit
      redirect_to :action => 'show', :id => @book
    end
  end

  def destroy
    @articles = Article.find(params[:id]).destroy
  end

  def article_params
    params.require(:article).permit(:title, :content, :user_id)    
  end

  def show_users
    @user = User..find(params[:id])
  end
end