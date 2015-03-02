require 'rails_helper'

describe Question do
  let(:user) { User.create(name: "John Smith", email: "john@email.com", 
                        phone: '4041234567', password: "foobar", 
                        password_confirmation: "foobar") }
  let(:question1) { Question.new( id: 1, sequence: 1, content: 'lorem ipsum blah blah1') }
  let(:question2) { Question.new( id: 2, sequence: 2, content: 'lorem ipsum blah blah2') }
  let(:question3) { Question.new( id: 3, sequence: 3, content: 'lorem ipsum blah blah3') }
  let(:question4) { Question.new( id: 4, sequence: 4, content: 'lorem ipsum blah blah4') }
  let(:answer1)   { Answer.new(content: 'lorem ipsum blah blah', question_id: 1, user_id: user.id) }
  # let(:answer2)   { Answer.new(content: 'lorem ipsum blah blah', question_id: 2, user_id: user.id) }

  subject { question1 }
    it { should respond_to(:sequence) } 
    it { should respond_to(:content) }
    it { should be_valid} 

  describe "validations" do
    describe "sequence" do
      context "not provided" do
        before { question1.sequence = nil }
           it { should_not be_valid}             
      end
    end

    describe "content" do
      context "not present" do
        before { question1.content = nil }
        it { should_not be_valid }
      end
      
      context 'too short' do
        before { question1.content = 'a' * 14 }
        it { should_not be_valid }
      end
    end
  end

  describe '.get_unanswered_questions' do
    it 'returns array of unanswered questions' do
      # answers = [1,2,3]
      # questions = [1,2,3,4,5,6]
      questions = Question.get_unanswered_questions(user)
      expect(questions.length).to eq(3)
    end              
  end

 # @user.questions
  
  describe '.get_question_content' do
    it 'should get the correct content' do
      content = Question.get_question_content(4)
      expect(content).to eq('lorem ipsum blah blah4')
    end
  end
end

