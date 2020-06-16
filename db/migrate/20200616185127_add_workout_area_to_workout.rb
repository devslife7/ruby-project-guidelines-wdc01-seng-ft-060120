class AddWorkoutAreaToWorkout < ActiveRecord::Migration[6.0]
  def change
    add_column :workouts, :workout_area, :string
  end
end
