App.global_chat = App.cable.subscriptions.create({
  channel: "TestChannel",
  param: '1'
}, {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    alert(data);
  },
  send_message: function(message, param) {
    return this.perform('send_message', {
      message: message,
      param: param
    });
  }
});