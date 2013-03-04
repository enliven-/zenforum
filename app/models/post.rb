class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id

  validates :title, presence: true, length: {maximum: 100}
  validates :content, presence: true, length: {maximum: 1000}

  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :subscribers
  belongs_to :user

  acts_as_likeable

  after_create :subscribe_user_to_the_post

  # def user_subscribed?(user)
  #   if self.subscribers.map(&:email).include?(user.email)
  #     true
  #   else
  #     false
  #   end
  # end

  def likes
    self.likers(User).count
  end

  private

  def subscribe_user_to_the_post
    if ! self.subscribers.map(&:email).include? self.user.email

      if ! self.user.subscribed_to_forum?
        subs = PostSubscriber.find_by_email(self.user.email) || PostSubscriber.create(email: self.user.email)
        self.subscribers << subs
      end

    end
  end

end
