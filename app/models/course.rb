class Course < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  has_many :flashes, dependent: :destroy
  has_many :flash_cards, dependent: :destroy
  has_many :user_echanges, class_name: "UserEchange",
                            foreign_key: "course_id",
                            dependent: :destroy

  ################## FIX N+1  ###############
Course.all.with_rich_text_content # Preload the body without attachments.
Course.all.with_rich_text_content_and_embeds # Preload both body and attachments.


##### STATUS  ########
STATUS = ["Lune", "Old"]

  ################## SLUG ###############
  validates :title, :content, :published,
            :level_name, :material_name,
            :user_id, :slug, :status, presence: true

  def slugged_custom
    #Apprendre-a-calculer-les-limites-math-tleD
    "#{title} #{material_name} #{level_name}"
  end

  extend FriendlyId
    friendly_id :slugged_custom, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

  #Scopeto find essential for course
  scope :essential, -> { where("feed_course.id = ?", feed_flash.course_id)}
  # Ex:- scope :active, -> {where(:active => true)}
end
