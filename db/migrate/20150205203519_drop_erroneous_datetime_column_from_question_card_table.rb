class DropErroneousDatetimeColumnFromQuestionCardTable < ActiveRecord::Migration
  def change
    remove_column :question_cards, :datetime
    change_column :question_cards, :expiration_date, :string
  end
end
