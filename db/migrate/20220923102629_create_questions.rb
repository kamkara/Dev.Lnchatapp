class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions, id: :uuid do |t|
      t.string :title, null: false
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
      t.belongs_to :course, null: false, foreign_key: true, type: :uuid
      t.string :slug

      t.timestamps
    end
  end
end
