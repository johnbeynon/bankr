class CreateCategoryMatchers < ActiveRecord::Migration
  def self.up
    create_table :category_matchers do |t|
      t.integer :category_id
      t.string :matcher

      t.timestamps
    end
  end

  def self.down
    drop_table :category_matchers
  end
end
