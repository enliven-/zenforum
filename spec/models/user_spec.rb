require 'spec_helper'

describe User do

  subject {FactoryGirl.create(:user)}

  it { should have_many(:posts) }
  it { should have_many(:comments) }
  it { should respond_to(:email)}
  it { should respond_to(:name)}
  it { should respond_to(:password)}

  describe "user as subscriber" do

    context "Subscriber" do

      it "user is not Subscriber" do
        subject.should_not be_subscribed
      end

      it "user is Subscriber" do
        Subscriber.create(email: subject.email)
        subject.should be_subscribed
      end

    end

    context "PostSubscriber" do

      it "user is not PostSubscriber" do
        subject.should_not be_subscribed_to_post
      end

      it "user is PostSubscriber" do
        PostSubscriber.create(email: subject.email)
        subject.should be_subscribed_to_post
      end
    end

    context "ForumSubscriber" do

      it "user is not ForumSubscriber" do
        subject.should_not be_subscribed_to_forum
      end

      it "user is PostSubscriber" do
        ForumSubscriber.create(email: subject.email)
        subject.should be_subscribed_to_forum
      end
    end

  end
end
