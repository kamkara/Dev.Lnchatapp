class Question < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :anwsers, class_name: "anwser", foreign_key: "question_id", dependent: :destroy
  
  #setup validation and uniqueness
  validates :title, presence: true, uniqueness: { scope: :course_id }
  
  #Slugged concern
  include ItemsSlugged

end