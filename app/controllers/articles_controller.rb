class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    # since nothing explicitly rendered here, defaults
    # to showing the index.html.erb file
  end

  def show
    # params[:id] is the query param from the route!
    @article = Article.find(params[:id])
  end

  def new
    # instantiates a new article but does not save it
    # to the database
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    # saved successfully to database
    if @article.save
      # redirect_to creates new browser request
      # important to redirect after a DB change so that
      # if the user refreshes the page, it doesn't try to
      # re-save the article
      redirect_to @article
    else # not saved successfully
      # renders the view without additional browser request
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article = Article.update(article_params)
      redirect_to @article
    else 
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
    def article_params
      # strong parameters
      params.require(:article).permit(:title, :body)
    end
end
