class CategoryType < ActiveRecord::Base
	
	validates :name, :presence => true
	
end
