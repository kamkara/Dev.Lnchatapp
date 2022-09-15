class Anwser < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_rich_text :content
end
