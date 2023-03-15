class AddKeyWordsToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :key_words, :string
  end
end
