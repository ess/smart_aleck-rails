class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.column :name, :string, null: false

      t.timestamps null: false
    end
  end
end
