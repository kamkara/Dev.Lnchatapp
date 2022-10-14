class Exercice < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_rich_text :content
  has_rich_text :correct_content
end
