require 'rails_helper'

describe "Session Pages" do
  subject { page } 

  describe "new" do
    before { visit signup_path }

    it { should have_content('Sign In') }
  end

end