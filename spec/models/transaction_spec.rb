require 'spec_helper'

describe Transaction do
  
  describe "Factory" do
    before { @transaction = Factory.build(:transaction) }
    subject { @transaction } 
    it { should be_valid }
    it "shouldn't raise an error when saved" do
      lambda{@transaction.save!}.should_not raise_error
    end
  end  
  
  it { should belong_to :account}
  it { should belong_to :category}
  it { should validate_presence_of :account_id}
  
  it { should validate_presence_of :amount}
  it { should validate_presence_of :posted_at}
  
  context "when a new credit transaction is added" do
    
    before do
      @transaction = Factory(:transaction, :amount => 10.0, :name => 'Kyan Media', :posted_at => Date.today)
      @transaction.save!
    end
    
    it "should set the transaction_type as credit" do
      @transaction.transaction_type.should == 'CREDIT'
    end
   
   
  end
  
  context "when a new debit transaction is added" do
    
    before do
      @transaction = Factory(:transaction, :amount => -10.0, :name => 'Sainsburys', :posted_at => Date.today)
      @transaction.save!
    end
    
    it "should set the transaction_type as debit" do
      @transaction.transaction_type.should == 'DEBIT'
    end
   
   
  end
  

end