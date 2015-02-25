class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.references :entry
      t.references :category

      t.timestamps null: false
    end

    add_index :categorizations, [:entry_id, :category_id], unique: true
  end
end
