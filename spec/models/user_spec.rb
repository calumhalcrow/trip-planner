require 'spec_helper'

describe User do
  it 'prevents new Users with invalid attributes from being saved' do
    user = User.create(:name => nil, :email => nil)
    user.persisted?.should be_false
    user.valid?.should be_false
    user.save.should be_false
  end
  it 'allows valid new Users to be saved' do
    user = User.create(:name => 'Joe Bloggs', :email => 'joe@bloggs.tld')

    user.persisted?.should be_true
    user.valid?.should be_true
    user.save.should be_true
  end
end
