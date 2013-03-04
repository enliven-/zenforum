require 'spec_helper'

describe CommentsController do

  include Devise::TestHelpers

  describe "POST create" do

    let(:postt) {FactoryGirl.create(:post)}

    it "creates a new Comment" do
      expect {
        post :create, {post_id: postt.id}, comment: FactoryGirl.attributes_for(:comment)
      }.to change(postt.reload.comments, :count).by(1)
    end

    it "redirects to the created post" do
      post :create, {post_id: postt.id}, comment: FactoryGirl.create(:comment)
      response.should redirect_to(postt)
    end



  end
end
