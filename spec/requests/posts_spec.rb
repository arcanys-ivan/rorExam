require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "should display some posts" do
      @post = Post.create title: 'Test Title', content: 'Some Post'

      visit posts_path
      page.should have_content 'Test Title'
      
   	end
  end
end
