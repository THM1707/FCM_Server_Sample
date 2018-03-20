Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'notification/topic', to: 'firebase#send_to_topic'
  post 'notification/data', to: 'firebase#send_topic_data'
end
