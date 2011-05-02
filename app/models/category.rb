class Category < ActiveRecord::Base

	has_many :transactions
	has_many :category_matchers
	belongs_to :category_type
	
	
	validates :name, :presence => true

end
