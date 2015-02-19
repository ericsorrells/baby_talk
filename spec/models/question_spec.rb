require 'rails_helper'

describe Question do
  #Write out a happy path example
  let(:question) { Question.new( sequence: 1, content: 'lorem ipsum') }
  #test getters and setters
  subject { question }
    it { should respond_to(:sequence) } #tests question.sequence returns anything but error
    it { should respond_to(:content) }
    it { should be_valid} #testing it passes all validations

  describe "validations" do
    describe "sequence" do
      context "not provided" do
        before { question.sequence = nil }
           it { should_not be_valid}             
      end
    end

    describe "content" do
      context "not present" do
        before { question.content = ' ' }
        it { should_not be_valid }
      end
    end
  end
end