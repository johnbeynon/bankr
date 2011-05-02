class CategoryType < ActiveRecord::Base
	
	has_many :categories
	belongs_to :account
	
	validates :name, :presence => true
	
end
