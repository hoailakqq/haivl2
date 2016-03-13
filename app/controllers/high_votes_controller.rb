class HighViewsController < ApplicationController
  before_action :check_user_signed_in

  def index
    @articles = Article.votes.order('created_at DESC')   
  end
end
