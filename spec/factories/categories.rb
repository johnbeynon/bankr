Factory.define :category do |f|
	f.name "Some Category"
	#f.association :category_type
end

Factory.define :insurances, :parent => :category do |f|
	f.name "Insurances"
	f.after_create { |category| Factory(:direct_link_insurance, :category => category)}
end
