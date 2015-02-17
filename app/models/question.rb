class Question < ActiveRecord::Base
  has_many    :answers, dependent: :destroy
  #validates :user_id, presence: true

  def self.get_answered_questions(user)
    answers = user.answers.pluck(:question_id)
    questions = Question.all.pluck(:id)
    answered_question_ids = questions & answers
  end

  def self.get_unanswered_questions(user)
    answers = user.answers.pluck(:question_id)
    questions = Question.all.pluck(:id)
    unanswered_question_ids = questions - answers 
  end

  def self.get_question_content(question_id)
    Question.where('id = ?', question_id).pluck(:content).first
  end

end
