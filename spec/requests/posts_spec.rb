require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "should display some posts" do
      @post = Post.create title: 'Test Title', content: 'Some Post'

      visit posts_path
      page.should have_content 'Test Title'

   	end

   	it "can create a new post" do
   	  visit posts_path
   	  within("#new_post") do
        fill_in 'post_title', :with => 'a title'
        fill_in 'post_content', :with => 'some message'
        uncheck('post_is_private')
      end

      click_button 'Create Post'

      current_path.should == posts_path
      page.should have_content 'a title'
   	end

  end
end
