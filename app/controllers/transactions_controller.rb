class TransactionsController < InheritedResources::Base
	
	def index
		@account = Account.find(params[:account_id])
		@transactions = @account.transactions.includes(:category).last_month
		if params[:type] == 'credits'
			@transactions = @transactions.credits
		elsif params[:type] == 'debits'
			@transactions = @transactions.debits
		end
	end
	
	def edit
		@account = Account.find(params[:account_id])
		edit!
	end
	
	def update
		@account = Account.find(params[:account_id])
		update!{account_transactions_path(@account)}
	end

	protected
	
	def begin_of_association_chain
		@current_user
	end

end
