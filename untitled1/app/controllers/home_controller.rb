class HomeController < ApplicationController
  def home
    @articles = Article.last(10)
  end
end
