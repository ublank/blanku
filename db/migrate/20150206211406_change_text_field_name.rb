class ChangeTextFieldName < ActiveRecord::Migration
  def change
    rename_column :answer_cards, :text, :answerText
    rename_column :question_cards, :text, :questionText
  end
end
