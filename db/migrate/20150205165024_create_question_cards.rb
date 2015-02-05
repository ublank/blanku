class CreateQuestionCards < ActiveRecord::Migration
  def change
    create_table :question_cards do |t|
      t.string :user_id
      t.string :text
      t.string :url
      t.string :expiration_date
      t.string :datetime

      t.timestamps null: false
    end
  end
end
