class CreateCategories < ActiveRecord::Migration
	def self.up
		create_table :categories do |t|
			t.integer :account_id
			t.integer :category_type_id
			t.string :name

			t.timestamps
		end
		add_index :categories, :account_id,					:unique => true
		add_index :categories, :category_type_id,		:unique => true
	end

	def self.down
		drop_table :categories
	end
end
