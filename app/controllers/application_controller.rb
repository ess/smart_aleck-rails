class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_current_categories

  private
  def get_current_categories
    current_tags
    viable_tags
  end

  def viable_tags
    @viable_tags = SmartAleck::FindingViablePeers.new(current_tags).viable_peers
  end
  helper_method :viable_tags

  def current_tags
    @current_tags = []
    if params[:tags].present?
      @current_tags =
        Category.where(name: params[:tags].split('/').map(&:downcase))
    end
    @current_tags
  end
  helper_method :current_tags
end
