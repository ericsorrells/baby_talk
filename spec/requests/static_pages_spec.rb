require 'rails_helper'

describe 'static pages' do
  subject { page }

  describe 'home page' do 
    before { visit root_path }
    it { should have_title("Home") }
  end

  describe 'about page' do
    before { visit static_pages_about_path }
    it { should have_title("About") }
  end
end 