class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.column :title, :string, null: false
      t.column :content, :text
      t.references :user

      t.timestamps null: false
    end
  end
end
