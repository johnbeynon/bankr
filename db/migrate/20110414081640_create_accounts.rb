class CreateAccounts < ActiveRecord::Migration
	def self.up
		create_table :accounts do |t|
			t.string :name
			t.decimal :balance
			t.string :bank_name
			t.integer :user_id

			t.timestamps
		end
		add_index :accounts, :user_id,								:unique => true
	end

	def self.down
		drop_table :accounts
	end
end
