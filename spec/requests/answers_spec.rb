require 'rails_helper'

describe 'answer pages' do
  subject { page }

  describe 'home page' do 
    before { answers_path }

    it { should have_title('Questions') }
    it { should have_selector('h1', text: 'Your Questions and Answers')}
  end


end 