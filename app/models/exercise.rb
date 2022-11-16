class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_rich_text :content
  has_rich_text :correct_content

  EDITION = [ "JD Edition", "Valesse Edition", "Odyssé Edition"]

  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end
