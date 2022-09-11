class Question < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :anwsers, class_name: "anwser", foreign_key: "question_id", dependent: :destroy 

  #Slugged concern
  include ItemsSlugged

  
end
