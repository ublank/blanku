class CreateAnswerCards < ActiveRecord::Migration
  def change
    create_table :answer_cards do |t|
      t.string :user_id
      t.string :text
      t.string :question_card_id

      t.timestamps null: false
    end
  end
end
