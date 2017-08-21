class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :value
      t.references :exercise, foreign_key: true

      t.timestamps
    end
  end
end
