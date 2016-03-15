class HomesController < ApplicationController
  def latest
    @articles = Article.order('created_at DESC').page(params[:page])
  end

  def hot
  	@articles = Article.hot_articles.order('SUM(votes.value) DESC').page(params[:page])
  end

  def oldest
    @articles = Article.order('created_at ASC').page(params[:page])
    
  end
end
