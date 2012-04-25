class CategoryMatchersController < InheritedResources::Base
	
	def create
		@category_matcher = CategoryMatcher.new(params[:category_matcher])
    @category_matcher.category_id = params[:category_id]
		create!
	end

end