Rails.application.routes.draw do
 

  devise_for :users

  post 'twilio/voice' => 'twilio#voice'

  post 'twilio/sms' => 'twilio#sms'

end
