class AdjustCategoryIndexes < ActiveRecord::Migration
  def self.up
		remove_index :categories, :account_id
		remove_index :categories, :category_type_id
  end

  def self.down
  end
end
