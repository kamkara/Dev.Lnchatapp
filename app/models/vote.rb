class Vote < ApplicationRecord
  belongs_to :question
  belongs_to :user

  enum choice: { up_vote: 1, down_vote: -1, cancel: 0 }

  after_update_commit do
    broadcast_replace_to "answers",
      target: dom_id(answer),
      partial: "answers/answer", locals: { answer: answer }
  end

end
