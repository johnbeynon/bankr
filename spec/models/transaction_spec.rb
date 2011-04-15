require 'spec_helper'

describe Transaction do
  
  describe "Factory" do
    before { @transaction = Factory.build(:transaction) }
    subject { @transaction } 
    it { should be_valid }
    xit "shouldn't raise an error when saved" do
      lambda{@transaction.save!}.should_not raise_error
    end
  end  
  
  it { should belong_to :account}
  
  context "when a new credit transaction is added" do
    
    before do
      @transaction = Factory(:transaction, :amount => 10.0, :vendor => 'Kyan Media', :statement_date => Date.today)
      @transaction.save!
    end
    
    it "should set the transaction_type" do
      @transaction.transaction_type.should == 'CREDIT'
    end
   
   
  end
  
  context "when a new debit transaction is added" do
    
    before do
      @transaction = Factory(:transaction, :amount => -10.0, :vendor => 'Sainsburys', :statement_date => Date.today)
      @transaction.save!
    end
    
    it "should set the transaction_type" do
      @transaction.transaction_type.should == 'DEBIT'
    end
   
   
  end
  

end