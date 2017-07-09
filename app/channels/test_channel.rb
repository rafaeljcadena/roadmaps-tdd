class TestChannel < ApplicationCable::Channel
  def subscribed
    stream_from "test_#{params['param']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
  	puts data
    # process data sent from the page
  end
end