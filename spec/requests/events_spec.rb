require 'rails_helper'

describe "Events Pages" do
  subject { page } 
  describe "index" do
    before { visit events_index_path }

    it { should have_title('Find Events') }
  end

end