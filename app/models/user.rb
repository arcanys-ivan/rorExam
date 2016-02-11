class User < ActiveRecord::Base
  authenticates_with_sorcery!

  #validates :password, length: { minimum: 3 }

  validates :email, uniqueness: true

  has_many :posts
end
