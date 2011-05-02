class Transaction < ActiveRecord::Base

	belongs_to :account
	belongs_to :category

	before_save :set_transaction_type, :match_category

	validates :account_id, :presence => true, :numericality => true
	validates :amount, :presence => true, :numericality => true
	validates :posted_at, :presence => true

	scope :credits, where(:transaction_type => 'CREDIT')
	scope :debits, where(:transaction_type => 'DEBIT')

	#default_scope where(:account_id => 1)

	private

	def set_transaction_type
		self.transaction_type = (amount > 0) ? 'CREDIT' : 'DEBIT'
	end
	
	def match_category
		matches = CategoryMatcher.where("matcher ILIKE ?", "#{self.name}")
		self.category_id = matches.first.category_id if matches.present?
	end

end
