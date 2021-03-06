class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :fetch_data

  protected
  def fetch_data
    @comments = Comment.order("created_at desc").last(25)
    @random_articles = Article.order("RAND()").first(5)
  end
end