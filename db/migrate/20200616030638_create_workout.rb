class CreateWorkout < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :title
      t.string :list_of_exercises
    end
  end
end
