class CreateUserExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :user_exercises do |t|
      t.integer :score
      t.references :exercise, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
