class HomeController < ApplicationController
  def home
    @articles = Article.all
    if params[:search]
      @articles = Article.search(params[:search]).order('created_at desc')
    else
      @articles = Article.all.order('created_at desc')
    end
  end
end