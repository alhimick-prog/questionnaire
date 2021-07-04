class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :text
      t.boolean :is_correct
      t.references :question

      t.timestamps
    end
  end
end
