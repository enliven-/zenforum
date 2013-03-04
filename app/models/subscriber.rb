class Subscriber < ActiveRecord::Base
  attr_accessible :email, :type


  validates :email, presence: true
   validates :email, uniqueness: true
   validates :email, format: {with: /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i }

  has_and_belongs_to_many :posts

end
