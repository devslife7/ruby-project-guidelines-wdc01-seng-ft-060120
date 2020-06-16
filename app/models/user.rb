class User < ActiveRecord::Base
    has_many :user_workouts
    has_many :workouts, through: :user_workouts

    # def username (user)
    # ##holds the username and password

    # end

end