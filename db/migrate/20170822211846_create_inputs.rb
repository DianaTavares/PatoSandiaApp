class CreateInputs < ActiveRecord::Migration[5.0]
  def change
    create_table :inputs do |t|
      t.integer :x_position
      t.integer :y_position
      t.string :answer
      t.references :exercise, foreign_key: true

      t.timestamps
    end
  end
end
