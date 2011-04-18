require 'spec_helper'

describe CategoryType do
  
  describe "Factory" do
    before { @category_type = Factory.build(:category_type) }
    subject { @category_type }
    it { should be_valid }
    it "shouldn't raise an error when saved" do
      lambda{@category_type.save!}.should_not raise_error
    end
  end  
  
  it { should validate_presence_of :name }

end