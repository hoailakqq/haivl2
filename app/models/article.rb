class Article < ActiveRecord::Base
	belongs_to :user
  has_many :comments
  has_many :votes
  has_attached_file :image , styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  paginates_per 50
  def votes_count(value)
    votes.where(value: value).count
  end
  
  def increase_views_count
    Article.increment_counter(:views_count, self.id)
  end
  
  def self.hot_articles
    joins('LEFT JOIN votes ON votes.article_id = articles.id')
    .group('articles.id')
    .order('SUM(votes.value) DESC')
    
  end
end
