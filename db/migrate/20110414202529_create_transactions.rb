class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :account_id
      t.date :statement_date
      t.decimal :amount
      t.string :vendor

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
