class ArticleNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ArticleNotificationsChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
