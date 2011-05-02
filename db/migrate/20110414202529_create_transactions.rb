class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :account_id
      t.date :posted_at
      t.decimal :amount
      t.string :name
      t.string :fitid

      t.timestamps
    end
		add_index :transactions, :account_id
  end

  def self.down
    drop_table :transactions
  end
end
