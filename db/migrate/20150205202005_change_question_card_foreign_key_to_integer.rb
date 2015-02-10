class ChangeQuestionCardForeignKeyToInteger < ActiveRecord::Migration

  def change
    change_column :question_cards, :user_id, 'integer USING CAST(user_id AS integer)'
  end

end
