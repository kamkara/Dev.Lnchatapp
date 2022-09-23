class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers, id: :uuid do |t|
      t.boolean :correct_answer, default: false
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
      t.belongs_to :question, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
