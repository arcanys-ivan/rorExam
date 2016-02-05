require 'rails_helper'

RSpec.describe "Posts", type: :request do

  before do
  	@post = Post.create title: 'Test Title', content: 'Some Post'
  end

  describe "GET /posts" do
    it "should display some posts" do
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

  describe "PUT /posts" do
  	it "edits a post" do
  	  visit posts_path
  	  click_link 'Edit'

  	  current_path.should == edit_post_path(@post)
  	  find_field('post_title').value.should == 'Test Title'
  	  find_field('post_content').value.should == 'Some Post'

      fill_in 'post_title', :with => 'updated title'
      fill_in 'post_content', :with => 'updated content'
      check('post_is_private')
      click_button 'Update Post'
      
      current_path.should == posts_path
      page.should have_content 'updated title'
  	  page.should have_content 'updated content'
  	end
  end

  describe "DELETE /posts" do
  	it "deletes a post" do
  	  visit posts_path
  	  find("#post_#{@post.id}").click_link "Delete"
  	  page.should_not have_content "Test Title"
  	  page.should_not have_content "Some Post"
  	end
  end

end
