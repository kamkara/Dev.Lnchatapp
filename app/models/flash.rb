class Flash < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_rich_text :content
  
  #setup validation and uniqueness
  validates :title, presence: true, uniqueness: { scope: :course_id }
  validates :content, :slug, :user_id, :course_id, presence: true

  #Slugged concern
  include ItemsSlugged


end
