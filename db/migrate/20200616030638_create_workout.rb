class CreateWorkout < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :title
    end
  end
end
