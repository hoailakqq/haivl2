class HomesController < ApplicationController
  def latest
    @articles = Article.order('created_at DESC').page(params[:page])
    
  end

  def hot
  end
end
