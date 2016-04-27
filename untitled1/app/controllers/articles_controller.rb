class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "u", password: "u", except: [:show]

  def index
    @articles = Article.all
    send(:test)
  end

  def send(val1)
    html = RestClient.get 'https://api.import.io/store/connector/0404192f-d64d-4e97-9ec4-0d317f9cfbb1/_query?input=webpage/url:https%3A%2F%2Fhabrahabr.ru%2F&&_apikey=220169357d384c2a80b6ebea670e270ffaa5a6c2aa410c414c06c642f14e78c3c39de42078a74478f56f4da25d887217743fd38aeaeae1862bc232c2a05f2ca755d362098fbba203a61d636edadab397', {:content_type => :json, :accept => :json}
    puts(html)
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
    puts @article
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
