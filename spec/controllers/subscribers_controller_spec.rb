require 'spec_helper'

describe SubscribersController do

  before do
    DatabaseCleaner.start
  end

  describe "POST create" do
    context "post subscription request" do
      let(:postt) { FactoryGirl.create(:post) }

      context "Subscriber isn't already registerd" do

        it "creates new subscriber" do
          expect {
            post :create, {post_subscriber: FactoryGirl.attributes_for(:post_subscriber).merge(post_id: postt.id)}
          }.to change(PostSubscriber, :count).by(1)
        end

      end

      context "Subscriber is already registered" do

        context "registered subscriber is PostSubscriber" do
          before do
            FactoryGirl.create(:post_subscriber)
          end

          it "should not create a new subscribe" do
            expect {
              post :create, {post_subscriber: FactoryGirl.attributes_for(:post_subscriber).merge(post_id: postt.id)}
            }.to_not change(PostSubscriber, :count)
          end

          it "associates subscriber to post" do
            expect {
              post :create, {post_subscriber: FactoryGirl.attributes_for(:post_subscriber).merge(post_id: postt.id)}
            }.to change(postt.subscribers, :count).by(1)
          end

        end

        context "registered subscriber is ForumSubscriber" do

          it "does nothing" do
            FactoryGirl.create(:forum_subscriber)
            expect {
              post :create, {post_subscriber: FactoryGirl.attributes_for(:post_subscriber).merge(post_id: postt.id)}
            }.to_not change(PostSubscriber, :count)
          end

        end
      end
    end

    context "forum subscription request" do

      context "Subscriber isn't already registered" do

        it "creates new subscriber" do
          expect {
            post :create, {forum_subscriber: FactoryGirl.attributes_for(:forum_subscriber)}
          }.to change(ForumSubscriber, :count).by(1)
        end

      end

    end

    context "forum subscription request" do

      context "Subscriber isn't already registered" do

        it "creates new subscriber" do
          expect {
            post :create, {forum_subscriber: FactoryGirl.attributes_for(:forum_subscriber)}
          }.to change(ForumSubscriber, :count).by(1)
        end

      end

      context "Subscriber is already registered" do

        context "registered subscriber is ForumSubscriber" do

          it "does not creates a new subscriber" do
            FactoryGirl.create(:forum_subscriber)
            expect {
              post :create, {forum_subscriber: FactoryGirl.attributes_for(:forum_subscriber)}
            }.to_not change(ForumSubscriber, :count)
          end

        end

        context "registered subscriber is PostSubscriber" do


          let(:subs) { FactoryGirl.create(:post_subscriber) }
          let(:postt) { FactoryGirl.create(:post) }

          xit "deletes all the associated posts and self" do
            postt.subscribers << subs
            subs.posts.should_not be_empty
            post :create, {forum_subscriber: FactoryGirl.attributes_for(:forum_subscriber)}
           # subs.posts.should be_empty
          end

        end
      end

    end

  end

  describe "DELETE destroy" do
    it "destroys the requested subscriber" do
      subs = FactoryGirl.create(:post_subscriber)
      expect {
        delete :destroy, {:id => subs.to_param}
      }.to change(Subscriber, :count).by(-1)
    end
  end

  after :each do
    DatabaseCleaner.clean
  end
end
