require 'rails_helper'

describe User do
  let(:user) { User.new(name: "John Smith", email: "john@email.com", 
                        phone: '404555555', password: "foobar", 
                        password_confirmation: "foobar") }

  subject{ user }
    it { should respond_to(:name) }
    it { should respond_to(:email)}
    it { should respond_to(:phone)  }
    it { should respond_to(:password_digest) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:authenticate) }
    it { should be_valid            }  

  describe 'validations' do
    context 'not provided' do    
      describe 'where a name is not present' do
        before { user.name = ' ' }
        it { should_not be_valid }
      end

      describe 'when email is not present' do
        before { user.email = ' ' }
        it { should_not be_valid }
      end
    end
  end
end

