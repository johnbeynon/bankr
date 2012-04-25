Factory.define :category_type do |f|
	f.name "Some Category Type"
	f.association :account
	#f.association :categories
end

# Factory.define :insurances, :parent => :category_type do |f|
# 	f.name "Insurances"
# 	f.after_create { |category_type| Factory(:home_insurance, :category_type => category_type) }
# end