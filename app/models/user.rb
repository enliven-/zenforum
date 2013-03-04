class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :name, :remember_me
  # attr_accessible :title, :body

  validates :name, presence: true

  has_many :posts
  has_many :comments

  acts_as_liker

  def subscribed?
    _subscriber?(Subscriber)
  end

  def subscribed_to_post?
    _subscriber?(PostSubscriber)
  end

  def subscribed_to_forum?
    _subscriber?(ForumSubscriber)
  end

  private

  def _subscriber?(klass)
    if klass.send(:find_by_email, self.email)
      true
    else
      false
    end
  end


end
