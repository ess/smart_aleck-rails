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

  def update
    @entry = Entry.find(params[:id])
    #if @entry.update_attributes(sanitized_params)
      #format.json {respond_with_bip(@entry, {})}
    #else
      #format.json {respond_with_bip(@entry, {})}
    #end
    @entry.update(sanitized_params)
    respond_to do |format|
      format.json {respond_with_bip(@entry)}
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:title, :content, :categories)
  end

  def sanitized_params
    categories = entry_params.delete(:categories)
    puts "categories == #{categories.to_json}"
    if categories
      @current_tags = Category.find(categories.split(',').map(&:to_i))
    end
    entry_params
  end
end
