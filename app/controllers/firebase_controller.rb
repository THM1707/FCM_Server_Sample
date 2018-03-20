class FirebaseController < ApplicationController
  require 'fcm'

  def send_to_topic
    topic = params['topic']
    message_body = params['body']
    message_title = params['title']
    fcm = FCM.new(Constants::KEY)
    response = fcm.send_to_topic(topic, notification: {body: message_body, title: message_title})
    render json: response, status: :ok
  end

  def send_topic_data
    topic = params['topic']
    message = params['message']
    title = params['title']
    image_url = params['image']
    timestamp = params['timestamp']
    fcm = FCM.new(Constants::KEY)
    response = fcm.send_to_topic(topic,
                                 data: {message: message,
                                        title: title,
                                        image: image_url,
                                        timestamp: timestamp
                                 },
                                 collapse_key: 'picture')
    render json: response, status: :ok
  end
end
