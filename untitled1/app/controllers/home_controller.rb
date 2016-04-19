class HomeController < ApplicationController
  def home
    @articles = Article.order('created_at desc').last(10)
  end
end