class CommentSerializer < ActiveModel::Serializer
	include  ActionView::Helpers::DateHelper
  attributes :id, :post, :user, :message, :created_at
  attributes :time_ago

  def time_ago
  	time_ago_in_words(object.created_at)
  end

   def user
    UserSerializer.new(object.user).attributes
  end
end