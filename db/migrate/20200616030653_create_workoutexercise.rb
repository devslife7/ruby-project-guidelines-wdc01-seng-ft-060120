class CreateWorkoutexercise < ActiveRecord::Migration[6.0]
  def change
    create_table :workoutexercises do |t|
      t.integer :workout_id
      t.integer :exercise_id
      t.integer :sets
      t.integer :reps
      t.string :dificulty_level
    end
  end
end