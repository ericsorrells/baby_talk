class NotificationsController < ApplicationController

   skip_before_action :verify_authenticity_token
 
  def notify
    content     = params['Body']
    number            = params['From']
    phone            = Notification.format_phone_num(number) 
    user        = User.find_user_by_phone_num(phone).first
    
    puts "CONTENT: #{content}"
    puts "NUMBER: #{number}"
    puts "PHONE: #{phone}"
    puts "USER: #{user}"

    question_id = Question.get_unanswered_questions(user)[0]

    Answer.create(:content => "#{content}", :user_id => user.id, :question_id => question_id)
  
    puts "CONTENT: #{content}"
    puts "PHONE: #{phone}"
    puts "PHONE CLASS: #{phone.class}"
    puts "USER_ID: #{user.id}"
    puts "QUESTION_ID: #{question_id}"
  end
   
  def send_text_message   

    question_id = Question.get_unanswered_questions(current_user)[0]
    message = Question.get_question_content(question_id)
    puts "CURRENT USER PHONE: #{current_user.phone}"

    number_to_send_to = current_user.phone #params[:number_to_send_to]
    account_sid = 'ACc1f381ba5f70dc60e3417c5ebb6ad1df' 
    auth_token = 'a6489d91a6ae5f484696fcf45963f893' 
     
    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 
     
    @client.account.messages.create({
      :from => '+15134881729', 
      :to => number_to_send_to, #ADD NUM_TO_SEND_TO!!!!!! "+#{number_to_send_to}"
      :body => "#{message}",  
    })

    redirect_to answers_path 
  end

  def show    
    @content = Notification.last.content
  end

  def index
  end
 
end
