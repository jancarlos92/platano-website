class DeleteOldArticlesJob
  include Sidekiq::Job

  def perform(articles)
    articles.delete_all
  end
end
