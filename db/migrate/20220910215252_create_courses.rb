class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses, id: :uuid do |t|
      t.string :title
      t.string :slug
      t.string :status
      t.string :level_name
      t.string :material_name
      t.references :user, null: false, foreign_key: true, type: :uuid
      
      t.timestamps
    end
  end
end
