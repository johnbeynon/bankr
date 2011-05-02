Factory.define :category_matcher do |f|
 f.matcher "some matcher"
end

Factory.define :direct_link_insurance, :parent => :category_matcher do |f|
	f.matcher "DIRECT LINE INS"
end