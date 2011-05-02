require 'spec_helper'

describe CategoryMatcher do
  
  describe "Factory" do
    before { @category_matcher = Factory.build(:category_matcher) }
    subject { @category_matcher }
    it { should be_valid }
    it "shouldn't raise an error when saved" do
      lambda{@category_matcher.save!}.should_not raise_error
    end
  end  
  
	it { should belong_to :category }
	
	

end