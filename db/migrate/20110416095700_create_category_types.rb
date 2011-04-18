class CreateCategoryTypes < ActiveRecord::Migration
  def self.up
    create_table :category_types do |t|
      t.integer :account_id
      t.string :name
      t.boolean :global, :default => false

      t.timestamps
    end
		add_index :category_types, :account_id,					:unique => true
  end

  def self.down
    drop_table :category_types
  end
end
