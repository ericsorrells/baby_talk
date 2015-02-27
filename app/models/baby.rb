class Baby < ActiveRecord::Base
  belongs_to :user

  validates :name,    presence: true, length: { minimum: 3 }
  validates :user_id, presence: true
end
