class Comment < ActiveRecord::Base
  attr_accessible :body, :user_id, :post_id

  validates :body, presence: true

  belongs_to :post
  belongs_to :user

  acts_as_likeable

  def likes
    self.likers(User).count
  end
  
end
