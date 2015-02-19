class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :content, presence: true
  validates :user_id, presence: true

  def self.get_answer_id(question_id, user)
    answer = Answer.where('question_id = ? AND user_id = ?', question_id, user).select(:id).first
  end

end
