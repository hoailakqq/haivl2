class MyArticlesController < ApplicationController
  before_action :check_user_signed_in

  def index
    @articles = current_user.articles.page(params[:page])
    
  end
end
