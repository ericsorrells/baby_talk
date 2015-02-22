require 'rails_helper'

describe "Answer Pages" do
  subject { page }

  describe "show" do
    let(:answer1) {Answer.new( id: 41, content: 'lorem ipsum', user_id: 5, question_id: 5 )}  
    before { visit answer_path(answer1.id)}

    it { should have_title('Show Answer') }
  end


end
