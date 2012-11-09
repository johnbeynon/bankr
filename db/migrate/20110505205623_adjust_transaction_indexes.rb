class AdjustTransactionIndexes < ActiveRecord::Migration
  def self.up
		remove_index :transactions, :category_id
  end

  def self.down
  end
end
