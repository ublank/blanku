class ChangeAnswerCardForeignKeysToIntegers < ActiveRecord::Migration
  def change
    change_column :answer_cards, :user_id, :integer
    change_column :answer_cards, :question_card_id, :integer
  end
end
