class VotesController < ApplicationController
  before_action :check_user_signed_in
  def create
    article = Article.find(params[:article_id])
    vote = Vote.where(user_id: current_user.id, article_id: article.id).first
    if vote == nil
      vote = Vote.new(params.require(:vote).permit(:value))
      vote.user = current_user
      vote.article = article
      vote.save!
    end
    redirect_to article_path(article)
  end
  def update
    article = Article.find(params[:article_id])
    value = params.require(:vote).require(:value)

    current_user.vote!(article, value)

    redirect_to article
  end

  def destroy
    article = Article.find(params[:article_id])
    current_user.unvote!(article)

    redirect_to article
  end
end
