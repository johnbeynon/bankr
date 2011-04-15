class Transaction < ActiveRecord::Base
  belongs_to :account
  
  before_save :set_transaction_type
  
  scope :credits, where(:transaction_type => 'CREDIT')
  scope :debits, where(:transaction_type => 'DEBIT')
  
  private
  
  def set_transaction_type
    self.transaction_type = (amount > 0) ? 'CREDIT' : 'DEBIT'
  end
  
end
