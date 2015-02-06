class ChangeTextFieldNameYetAgain < ActiveRecord::Migration
  def change
    rename_column :answer_cards, :answerText, :answer_text
    rename_column :question_cards, :questionText, :question_text
  end
end
