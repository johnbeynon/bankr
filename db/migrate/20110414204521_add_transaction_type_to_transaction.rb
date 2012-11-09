class AddTransactionTypeToTransaction < ActiveRecord::Migration
  def self.up
    add_column :transactions, :transaction_type, :string
    add_index :transactions, :transaction_type
  end

  def self.down
    remove_column :transactions, :transaction_type
  end
end
