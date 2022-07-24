class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # Next line of code we know will take some time to process
    # In real life this could be a call for example to generate a report, perform a complex SQL query etc.
    # For the sake of testing the method contains only sleep(20)

    prepared_params = ExternalCall.run_complex_sql_query(article_params)
    @article = Article.new(prepared_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
