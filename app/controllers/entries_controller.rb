class EntriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @entry = Entry.new
    @entries = Entry.where(
      category_hash: SmartAleck::CategoryIndexer.index(current_tags)
    )
  end

  def create
    @entry = SmartAleck::EntryCreator.create(
      title: sanitized_params[:title],
      content: sanitized_params[:content],
      categories: @current_tags,
      user: current_user
    )

    redirect_to context_link, notice: "Your entry was created"

  end

  private
  def entry_params
    params.require(:entry).permit(:title, :content, :categories)
  end

  def sanitized_params
    categories = entry_params.delete(:categories)
    puts "categories == #{categories.to_json}"
    @current_tags = Category.find(categories.split(',').map(&:to_i))
    entry_params
  end
end
