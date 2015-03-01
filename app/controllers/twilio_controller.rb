require 'twilio-ruby'
 
class TwilioController < ApplicationController
  include Webhookable
 
  after_filter :set_header
 
  skip_before_action :verify_authenticity_token
 # put your own credentials here 

  def voice
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Hey there. Congrats on integrating Twilio into your Rails 4 app.', :voice => 'alice'
         r.Play 'http://linode.rabasa.com/cantina.mp3'
    end
 
    render_twiml response
  end

  	def sms 
	  	account_sid = 'AC3e23d27053072d86358e9ce88ea1be62' 
		auth_token = '346ba335ec11288671480bcf3fc7beba' 
		@client = Twilio::REST::Client.new account_sid, auth_token 
		 
		@client.account.messages.create({
			:body => "Christian! I love you <3",
			:to => "+573005787275",
			:from => '+19099069302'  
		})
	end
end