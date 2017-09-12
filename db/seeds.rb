# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  #Users

  User.create(first_name: "Justin", last_name: "Man", username: "test1", password: "test1")
  User.create(first_name: "Ben", last_name: "Lea", username: "test2", password: "test1")
  User.create(first_name: "Mister", last_name: "Man", username: "test3", password: "test1")

 # Exercises

  Exercise.create(name: "Bench Press")
  Exercise.create(name: "Squats")
  Exercise.create(name: "Shoulder Press")
  Exercise.create(name: "Bicep Curls")
  Exercise.create(name: "Deadlifts")


 # Routines

 Routine.create(name: "Chest Burster", user_id: 1)
 Routine.create(name: "Legs for days", user_id: 2)
 Routine.create(name: "Arms", user_id: 3)

 #Exercise routines

 RoutineExercise.create(routine_id: 1, exercise_id: 1, days_of_week: 17, sets: 4, reps: 12, weight: 135)
 RoutineExercise.create(routine_id: 2, exercise_id: 2, days_of_week: 16, sets: 4, reps: 10, weight: 135)
 RoutineExercise.create(routine_id: 2, exercise_id: 1, days_of_week: 5, sets: 3, reps: 5, weight: 315)
 RoutineExercise.create(routine_id: 3, exercise_id: 4, days_of_week: 65,sets: 5, reps: 8, weight: 135)
