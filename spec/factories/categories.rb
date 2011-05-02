Factory.define :category do |f|
	f.name "Some Category"
	#f.association :category_type
end

Factory.define :home_insurance, :parent => :category do |f|
	f.name "Home Insurance"
	f.after_create { |category| Factory(:direct_link_insurance, :category => category)}
end
