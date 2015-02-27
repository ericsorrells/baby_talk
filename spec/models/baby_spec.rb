require 'rails_helper'

describe Baby do
  let(:baby) { Baby.new(name: 'Baby John Doe', sex: 'M', month: 1, day: 31, year: 1978, user_id: 4) }

  subject { baby }
  it { should respond_to(:name) }
  it { should respond_to(:sex) }
  it { should respond_to(:month) }
  it { should respond_to(:day) }
  it { should respond_to(:year) }
  it { should respond_to(:user_id) }
  it { should be_valid }

  describe 'validations' do
    describe 'name' do
      context 'not provided' do
          before { baby.name = nil }
          it { should_not be_valid }
        end

      context 'too short' do 
        before { baby.name = 'AB'}
        it { should_not be_valid }
      end
    end
  end
end

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