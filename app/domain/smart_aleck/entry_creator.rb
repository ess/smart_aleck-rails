require 'optionally/required'
require_relative '../smart_aleck/category_indexer'

module SmartAleck
  class EntryCreator
    include Optionally::Required

    attr_reader :entry

    def self.create(options = {})
      new(options).entry
    end

    def initialize(options = {})
      check_required_options(options, :title, :content, :categories, :user)
      @title = options[:title]
      @content = options[:content]
      @categories = options[:categories]
      @user = options[:user]
      populate_entry!
      categorize_entry!
    end

    private
    def populate_entry!
      @entry = Entry.create(
        title: @title,
        content: @content,
        category_hash: CategoryIndexer.index(@categories),
        user: @user
      )
    end

    def categorize_entry!
      @categories.each do |category|
        @entry.categories << category
      end
    end
  end
end
