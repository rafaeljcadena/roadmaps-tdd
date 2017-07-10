App.global_chat = App.cable.subscriptions.create({
  channel: "UserNotificationChannel"
}, {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    var html = '<a class="lv-item unviewed" data-id="32" title="' + data.notification.text + '" href="' + data.notification.link_url + '">\
                  <div class="media">\
      <div class="pull-left">\
        <img class="lv-img-sm" src="' + data.notification.image_url + '" alt="" data-original-title="" title="">\
      </div>\
    <div class="media-body">\
      <div class="lv-title">' + data.notification.text + '</div>\
      <small class="lv-small">' + data.notification.created_at + '</small>\
    </div></div></a>'
    $("#notifications .lv-body").prepend(html);
    $("#notification_counter").html(data.number);
    $("#notification_counter").show();
  },
  send_message: function(message, param) {
    // return this.perform('send_message', {
    //   message: message,
    //   param: param
    // });
  }
});