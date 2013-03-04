require 'spec_helper'

describe Post do

	subject {FactoryGirl.create(:post)}

    it { should have_many(:comments) }
    it { should have_and_belong_to_many(:subscribers) }
    it { should belong_to(:user)}

    # it "user should not be subscribed" do
    # 	subject.should_not
    # 	subs = FactoryGirl.create(:post_subscriber)
    # 	subject.subscribers
    # end
end
