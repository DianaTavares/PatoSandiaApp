class CreateJoinTableUsersExercises < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :exercises do |t|
      # t.index [:user_id, :exercise_id]
      # t.index [:exercise_id, :user_id]
    end
  end
end
