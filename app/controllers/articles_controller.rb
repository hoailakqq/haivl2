class ArticlesController < ApplicationController
  def new
    @article = Article.new(params[:id])
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :content))
    if @article.save
      redirect_to root_path
    else
      render :new
      
    end
  end

  def edit
    @article = Article.find(params[:id])
  end
    
  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :content))
      redirect_to root_path
    else
      render :edit
      
    end
  end

  def destroy
    
  end
end