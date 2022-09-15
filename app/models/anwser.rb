class Anwser < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_rich_text :content
  

  ################## FIX N+1  ###############
  Anwser.all.with_rich_text_content # Preload the body without attachments.
  Anwser.all.with_rich_text_content_and_embeds # Preload both body and attachments.

  validates :content, presence: true

end
