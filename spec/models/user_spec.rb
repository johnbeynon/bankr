require 'spec_helper'

describe User do
  
  describe "Factory" do
    before { @user = Factory.build(:user) }
    subject { @user }
    it { should be_valid }
    it "shouldn't raise an error when saved" do
      lambda{@user.save!}.should_not raise_error
    end
  end  
  
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  
  it { should have_many :accounts}

end