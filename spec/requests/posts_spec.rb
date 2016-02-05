require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "should display some posts" do
    	visit posts_path
    	page.should have_content 'sample post'
   	end
  end
end
