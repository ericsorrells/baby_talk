require 'rails_helper'

describe Answer do
  let(:answer) { Answer.new(content: 'lorem ipsum', question_id: 3, user_id: 2) }  

  subject { answer }
  it { should respond_to(:content) }
  it { should respond_to(:question_id) }
  it { should respond_to(:user_id) }
  it { should be_valid }

  describe 'validations' do
    context 'when not provided' do
      describe 'when content is not provided' do
        before { answer.content = ' ' }
        it { should_not be_valid }
      end
    end
  end

end
