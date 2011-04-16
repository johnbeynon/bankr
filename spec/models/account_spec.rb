require 'spec_helper'

describe Account do
  
  describe "Factory" do
    before { @account = Factory.build(:account) }
    subject { @account }
    it { should be_valid }
    it "shouldn't raise an error when saved" do
      lambda{@account.save!}.should_not raise_error
    end
  end  
  
  it { should validate_presence_of :name }
  it { should validate_presence_of :bank_name }
  it { should validate_presence_of :user_id }
  
  it { should validate_numericality_of(:balance) }
  
  it { should belong_to :user}

end