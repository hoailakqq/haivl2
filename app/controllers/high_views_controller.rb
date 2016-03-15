class HighViewsController < ApplicationController
 

  def index
    @articles = Article.order('views_count DESC')
    
  end
end
