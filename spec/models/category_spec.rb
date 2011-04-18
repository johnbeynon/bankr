require 'spec_helper'

describe Category do
  
  describe "Factory" do
    before { @category = Factory.build(:category) }
    subject { @category }
    it { should be_valid }
    it "shouldn't raise an error when saved" do
      lambda{@category.save!}.should_not raise_error
    end
  end  
  
  it { should validate_presence_of :name }

end