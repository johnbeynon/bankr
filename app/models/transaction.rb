class Transaction < ActiveRecord::Base

	belongs_to :account
	belongs_to :category

	before_save :set_transaction_type, :match_category
	
	after_save :update_category_matchers

	validates :account_id, :presence => true, :numericality => true
	validates :amount, :presence => true, :numericality => true
	validates :posted_at, :presence => true

	scope :credits, where(:transaction_type => 'CREDIT')
	scope :debits, where(:transaction_type => 'DEBIT')
	scope :last_month, lambda { where('posted_at >= ? and posted_at <= ?', Date.today.months_ago(1).beginning_of_month, Date.today.months_ago(1).end_of_month) }
	
	scope :for_month, lambda { |ago| where('posted_at >= ? and posted_at <= ?', Date.today.months_ago(ago).beginning_of_month, Date.today.months_ago(ago).end_of_month) }
	
	default_scope order('posted_at DESC')

	private

	def set_transaction_type
		self.transaction_type = (amount > 0) ? 'CREDIT' : 'DEBIT'
	end
	
	def match_category
		matches = CategoryMatcher.where("matcher ILIKE ?", "#{self.name}")
		self.category_id = matches.first.category_id if matches.present?
	end
	
	def update_category_matchers
	  if category
	    @existing_matcher = CategoryMatcher.where("matcher ILIKE ?", "#{self.name}")
  	  unless @existing_matcher.present?
  	    category.category_matchers << CategoryMatcher.new(:matcher => self.name)
  	  end
  	end
	end

end
