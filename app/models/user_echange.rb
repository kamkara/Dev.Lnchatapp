class UserEchange < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_rich_text :content
  has_rich_text :wiki


 ################## FIX N+1  ###############
Course.all.with_rich_text_content # Preload the body without attachments.
Course.all.with_rich_text_content_and_embeds # Preload both body and attachments.


##### STATUS  ########
STATUS = ["Lune", "Old"]

  ################## SLUG ###############
  validates :title, :course_id, :user_id, :slug, presence: true

  def slugged_custom
    #Apprendre-a-calculer-les-limites-math-tleD
    "#{title} #{course_id}"
  end

  extend FriendlyId
    friendly_id :slugged_custom, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

end
