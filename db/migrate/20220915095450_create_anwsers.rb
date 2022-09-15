class CreateAnwsers < ActiveRecord::Migration[7.0]
  def change
    create_table :anwsers, id: :uuid do |t|
      t.references :question, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
