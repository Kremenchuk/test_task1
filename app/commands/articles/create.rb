class Articles::Create

  attr_reader :params

  def initialize(params)
    @params = params
  end

  def execute
    prepared_params = ExternalCall.run_complex_sql_query(params)
    article = Article.new(prepared_params)
    if article.save
      new_article = ApplicationController.render partial: 'articles/new_article', locals: {article: article}
      ActionCable.server.broadcast("ArticleNotificationsChannel",  success_response(new_article))
    else
      ActionCable.server.broadcast("ArticleNotificationsChannel", errors_response(article))
    end
  end

  private

    def success_response(data)
      {
        notice: "Article was successfully created.",
        article: data,
      }
    end

    def errors_response(data)
      {
        notice: "Article was not created. Errors: #{data.errors.full_messages}"
      }
    end

end