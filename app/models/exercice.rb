class Exercice < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_rich_text :content
  has_rich_text :correct_content


  #setup validation and uniqueness
  validates :name, :slug, :content, :correct_content, :user_id, :course_id, presence: true

  #### SLUG ####
  extend FriendlyId
    friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end

end
