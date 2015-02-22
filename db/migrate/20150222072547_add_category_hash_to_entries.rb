class AddCategoryHashToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :category_hash, :bigint, default: 0
    add_index :entries, :category_hash
  end
end
