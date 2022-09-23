class Question < ApplicationRecord
  
  
  ################## RELATIONS  ###############
  belongs_to :user
  belongs_to :course
  has_rich_text :content
  has_many :answers, class_name: "Answer",
                      foreign_key: "question_id",
                      dependent: :destroy
  has_many :votes, class_name: "Vote",
                    foreign_key: "user_id",
                    dependent: :destroy


  ################## Up vote  ###############
  after_create_commit do
    broadcast_append_to :answers,
      target: "answers",
      partial: "answers/answer",
      locals: { answer: self }
  end

  def vote_count
    votes.sum(:choice)
  end


  ################## FIX N+1  ###############
  Question.all.with_rich_text_content # Preload the body without attachments.
  Question.all.with_rich_text_content_and_embeds # Preload both body and attachments.

  validates :course_id, presence: true

  #Slugged concern
  include ItemsSlugged


end
