class ArticlesController < ApplicationController
  include Roar::Rails::ControllerAdditions
  respond_to :json

  # GET /articles.json
  def index
    @articles = Article.all

    respond_with(@articles)
  end

  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_with @article
  end

  # POST /articles.json
  def create
    @article = Article.new.consume!
    @article.save
    respond_with @article
  end

  # PUT /articles/1.json
  def update
    @article = consume!(Article.find(params[:id]))

    @article.save

    respond_with @article
  end

  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    head :no_content
  end
end
