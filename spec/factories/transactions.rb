Factory.define :transaction do |f|
  f.amount 0
  f.posted_at '2011-04-16'
  f.association :account
	#f.association :category
end