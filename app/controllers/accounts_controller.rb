class AccountsController < InheritedResources::Base
	
	def create
		@account = Account.new(params[:account])
    @account.user_id = current_user.id
		create!
	end
	
	def show
		params[:months_ago] ||= 1
		@account = Account.find(params[:id])
		@transactions = @account.transactions.for_month(params[:months_ago].to_i).includes(:category)
		show!
	end
	
	protected
	
	def begin_of_association_chain
		@current_user
	end
	
end