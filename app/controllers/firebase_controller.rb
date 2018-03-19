class FirebaseController < ApplicationController
  require 'fcm'

  def send_to_topic
    topic = params["topic"]
    message_body = params["body"]
    message_title = params["title"]
    fcm = FCM.new(Constants::KEY)
    response = fcm.send_to_topic(topic, notification: {body: message_body, title: message_title})
    render json: response, status: :ok
  end

  def send_to_device
    # token = params["token"]
    # message_body = params["body"]
    # message_title = params["title"]
    # option = {notification: {body: message_body, title: message_title}}
    # fcm = get_fcm
    # response = fcm.send(token, option)
    # render json: response, status: :ok
    fcm = FCM.new(Constants::KEY)
    response = fcm.send(["eIm5ue6s1aU:APA91bFnpJOUai2W8RzuZOVtOG5cZNyJxa94SE953HoLk_iato77bsIScgIOuBNTH3519ZwgTaAHMm0cAoNGvBiTDUfrJ_C-v2BQ4gbyu7GmrZdUH0W-LniXmJi_vrQXR0nbQ2qBxKHi"],
                        notification: {body: "Test", title: "Test message"})
    render json: response, status: :ok

  end
end