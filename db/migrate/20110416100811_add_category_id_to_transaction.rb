class AddCategoryIdToTransaction < ActiveRecord::Migration
	def self.up
		add_column :transactions, :category_id, :integer
		add_index :transactions, :category_id,					:unique => true
	end

	def self.down
		remove_column :transactions, :category_id
	end
end
