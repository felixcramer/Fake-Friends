class AddPluralToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :plural, :boolean, :default => false
  end
end
