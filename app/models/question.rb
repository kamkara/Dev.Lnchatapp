class Question < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_rich_text :content
  has_many :answers, class_name: "Answer", foreign_key: "question_id", dependent: :destroy
  ################## FIX N+1  ###############
  Question.all.with_rich_text_content # Preload the body without attachments.
  Question.all.with_rich_text_content_and_embeds # Preload both body and attachments.

  validates :course_id, presence: true

  #Slugged concern
  include ItemsSlugged


end
