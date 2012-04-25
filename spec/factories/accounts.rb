Factory.define :account do |f|
	f.name "Some account name"
	f.bank_name "Some bank name"
	f.balance 0
	f .association :user

	f.after_create { |account| Factory(:insurances, :account => account) }
end