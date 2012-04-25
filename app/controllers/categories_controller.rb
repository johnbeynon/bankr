class CategoriesController < InheritedResources::Base
	
	def create
		@category = Category.new(params[:category])
    @category.account_id = params[:account_id]
		create!
	end

end