require 'rails_helper'

describe 'users page' do
  subject { page }

  describe 'show' do
  let(:user) { User.new(name: "John Smith", email: "john@email.com", 
                        phone: '404555555', password: "foobar", 
                        password_confirmation: "foobar") }  

  before { visit user_path }

  it { should have_title{user.user_name}}
  it { should have_selector('h1', text: user.name)}
  end

end

