require 'rails_helper'

describe "User pages" do
  subject { page }

  describe "signup page" do
    before { visit signup_path }
    it { should have_content('Sign Up') }
  end

  describe "signin page" do
    before { visit signin_path }
    it { should have_content('Sign In')}
  end

  #  describe "show page" do
  #   let(:user) { User.new(id: 5, name: "John Smith", email: "john@email.com", 
  #                        phone: '404555555', password: "foobar", 
  #                        password_confirmation: "foobar") } 
  #   before { visit user_path(user.id) }
  #   it { should have_content('Your Profile') }
  # end

end

