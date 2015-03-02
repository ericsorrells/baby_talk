class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :users, through: :answers

  validates :sequence, presence: true   
  validates :content,  presence: true, length: { minimum: 15 }


  def self.get_answered_questions(user)
    answers = user.answers.pluck(:question_id) #get all answers
    questions = Question.all.pluck(:id) #get all questions
    answered_question_ids = questions & answers #get array of questions w answers
  end

  def self.get_unanswered_questions(user)
    answers = user.answers.pluck(:question_id)
    questions = Question.all.pluck(:id)
    unanswered_question_ids = questions - answers 
  end

  def self.get_question_content(question_id)
    Question.find(question_id).content
  end

end
