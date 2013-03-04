require 'spec_helper'

describe Subscriber do

	it {should have_and_belong_to_many(:posts)}
end
