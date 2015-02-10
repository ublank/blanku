class ChangeAnswerCardForeignKeysToIntegers < ActiveRecord::Migration
  def change
    change_column :answer_cards, :user_id, 'integer USING CAST(user_id AS integer)'
    change_column :answer_cards, :question_card_id, 'integer USING CAST(question_card_id AS integer)'
  end
end
