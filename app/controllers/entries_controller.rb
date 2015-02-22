class EntriesController < ApplicationController

  def index
    current_tags
    @entries = Entry.all
  end

  private
  def current_tags
    @current_tags = []
    if params[:tags].present?
      @current_tags = params[:tags].split('/').map(&:downcase)
    end
    @current_tags
  end

end
