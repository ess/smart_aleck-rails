class EntriesController < ApplicationController
  def index
    @entries = Entry.where(
      category_hash: SmartAleck::CategoryIndexer.index(current_tags)
    )
  end
end
