require 'rails_helper'

describe Notification do

  describe 'format phone number' do
    context 'when provided' do
        describe 'should be correct format' do
          number='+15555555555'
          formatted_num = Notification.format_phone_num(number)
          #Notification.format_phone_num(number).should == '5555555555'
         # expect(Notification.format_phone_num(number)).to eq('5555555555')
      end
    end
  end
end


#   def self.format_phone_num(number)
#     number = number[2..12].to_s
#   end




# describe User do
#   let(:user) { User.new(name: "John Smith", email: "john@email.com", 
#                         phone: '404555555', password: "foobar", 
#                         password_confirmation: "foobar") }

#   subject{ user }
#     it { should respond_to(:name) }
#     it { should respond_to(:email)}
#     it { should respond_to(:phone)  }
#     it { should respond_to(:password_digest) }
#     it { should respond_to(:password) }
#     it { should respond_to(:password_confirmation) }
#     it { should respond_to(:authenticate) }
#     it { should be_valid            }  

#   describe 'validations' do
#     context 'not provided' do    
#       describe 'where a name is not present' do
#         before { user.name = ' ' }
#         it { should_not be_valid }
#       end

#       describe 'when email is not present' do
#         before { user.email = ' ' }
#         it { should_not be_valid }
#       end
#     end
#   end
# end