class Post < ActiveRecord::Base
  authenticates_with_sorcery!

  belongs_to :user

  scope :is_public, -> { where('is_private is not true') }
end