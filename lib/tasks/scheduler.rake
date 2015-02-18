desc "Task to Send Out Questions Daily"
  task :send_text_message => :environment do
    puts "About to send out Message..."
    Notification.send_text_message
    puts "done."
  end