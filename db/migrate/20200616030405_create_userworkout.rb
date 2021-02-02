class CreateUserworkout < ActiveRecord::Migration[6.0]
  def change
    create_table :userworkouts do |t|
      t.integer :user_id
      t.integer :workout_id
    end
  end
end
