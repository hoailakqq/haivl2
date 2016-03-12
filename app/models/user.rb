class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles
  has_many :comments

  has_many :votes
  def vote!(article, value)
    vote = Vote.where(user: self, article: article).first_or_initialize
    vote.value = value
    vote.save!
  end

  def unvote!(article)
    Vote.where(user: self, article: article).delete_all
  end

  def voted?(article, value)
    Vote.where(user: self, article: article, value: value).exists?
  end
end
