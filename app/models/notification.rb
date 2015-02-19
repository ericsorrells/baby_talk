class Notification < ActiveRecord::Base

  def self.format_phone_num(number)
    number = number[2..12].to_s
  end

  def self.send_text_message   
    account_sid = 'ACc1f381ba5f70dc60e3417c5ebb6ad1df' 
    auth_token = 'a6489d91a6ae5f484696fcf45963f893'
    
    all_users = User.all
    
    all_users.each do |user|
      question_id = Question.get_unanswered_questions(user)[0]
      # puts "QUESTION ID: #{question_id}"
      message = Question.get_question_content(question_id)
      # puts "MESSAGE: #{message}"
      # puts "USER PHONE: #{user.phone}"

      number_to_send_to = user.phone

      @client = Twilio::REST::Client.new account_sid, auth_token 

      @client.account.messages.create({
      :from => '+15134881729', 
      :to => number_to_send_to, 
      :body => "#{message}",  
      })
    end
  end
  
end
