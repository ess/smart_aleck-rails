class ConvertEntryCategoryHashToString < ActiveRecord::Migration
  def self.up
    change_table :entries do |t|
      t.change :category_hash, :text
    end

    Entry.all.each do |entry|
      entry.category_hash = SmartAleck::CategoryIndexer.index(entry.categories)
      entry.save
    end
  end

  def self.down
    change_table :entries do |t|
      t.change :category_hash, :bigint
    end
  end
end
