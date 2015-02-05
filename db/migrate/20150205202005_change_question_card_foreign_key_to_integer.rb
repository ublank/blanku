class ChangeQuestionCardForeignKeyToInteger < ActiveRecord::Migration

  def change
    change_column :question_cards, :user_id, :integer
  end

end
