class HighViewsController < ApplicationController
  before_action :check_user_signed_in

  def index
    @articles = Article.order('views_count DESC')
    
  end
end
