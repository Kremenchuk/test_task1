class ArticleWorker
  include Sidekiq::Job

  queue_as :default

  def perform(params)
    # Do something later
    Articles::Create.new(params).execute
  end
end
