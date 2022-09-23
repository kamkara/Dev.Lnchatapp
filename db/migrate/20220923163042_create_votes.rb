class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes, id: :uuid do |t|
      t.integer :choice, limit: 1, default: 0
      t.belongs_to :question, null: false, foreign_key: true, type: :uuid
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
