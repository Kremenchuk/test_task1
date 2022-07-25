import consumer from "channels/consumer"

consumer.subscriptions.create("ArticleNotificationsChannel", {
  received(data) {
    console.log(data)
    if (data['notice']) {
      alert(data['notice'])
    }
    if (data['article']) {
      const html = data['article']
      const element = document.querySelector("#articles_list")
      element.insertAdjacentHTML("beforeend", html)
    }
  }
});
