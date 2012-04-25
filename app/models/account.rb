class Account < ActiveRecord::Base
	belongs_to :user

	validates :user_id, :presence => true, :numericality => true
	validates :name, :presence => true
	validates :bank_name, :presence => true
	#validates :balance, :presence => true, :numericality => true
	
	has_many :transactions
	has_many :categories



end
