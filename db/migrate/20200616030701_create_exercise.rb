class CreateExercise < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :exercise
    end
    
  end
end
