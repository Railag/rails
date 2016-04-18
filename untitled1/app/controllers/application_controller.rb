class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :fetch_data

  protected
  def fetch_data
    @comments = Comment.last(25)
    @articles = Article.order("RAND()").first(5)
  end
end