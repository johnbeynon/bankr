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
      @transaction = Factory(:transaction, :amount => 10.0, :name => 'DIRECT LINE INS', :posted_at => Date.today)
      @transaction.save!
    end
    
    it "should set the transaction_type as credit" do
      @transaction.transaction_type.should == 'CREDIT'
    end
		it "should be matched accordingly" do
			@transaction.category_id.should === Category.where('name = ?', 'Insurances').first.id
		end
     xit "should not create a new category matcher" do        
       expect { @transaction.save! }.to not_change(CategoryMatcher, :count).by(1)  
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
  
  context "when an existing transaction is updated with a category" do
    
     before do
        @category = Factory(:category)
        @transaction = Factory(:transaction, :amount => -10.0, :name => 'Asda', :posted_at => Date.today)
        @transaction.category = @category
      end

      it "should create a new category matcher" do        
        expect { @transaction.save! }.to change(CategoryMatcher, :count).by(1)  
      end
    
  end
  

  

end