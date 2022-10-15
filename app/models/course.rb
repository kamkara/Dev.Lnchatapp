class Course < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  has_many :flashes, class_name: "Flash", foreign_key: "course_id", dependent: :destroy
  has_many :questions, class_name: "Question", foreign_key: "course_id", dependent: :destroy
  has_many :anwsers, class_name: "Anwser", foreign_key: "course_id", dependent: :destroy
  has_many :exercices, class_name: "Exercice", foreign_key: "course_id", dependent: :destroy
                            

################## FIX N+1  ###############
Course.all.with_rich_text_content # Preload the body without attachments.
Course.all.with_rich_text_content_and_embeds # Preload both body and attachments.


##### STATUS  ########
STATUS = ["Lune", "Old"]

  ################## SLUG ###############
  validates :title, :content, :user_id,
            :level_name, :material_name,
            :slug, :status, presence: true

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
