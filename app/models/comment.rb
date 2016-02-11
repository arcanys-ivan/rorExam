class Comment < ActiveRecord::Base
  authenticates_with_sorcery!

  belongs_to :post
  belongs_to :user
end