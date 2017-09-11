# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  #Users

  User.create(first_name: "Justin", last_name: "Man")
  User.create(first_name: "Ben", last_name: "Lea")
  User.create(first_name: "Mister", last_name: "Man")

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

 RoutineExercise.create(routine_id: 1, exercise_id: 1, day_of_week: "monday", sets: 4, reps: 12, weight: 135)
 RoutineExercise.create(routine_id: 2, exercise_id: 2, day_of_week: "tuesday", sets: 4, reps: 10, weight: 135)
 RoutineExercise.create(routine_id: 2, exercise_id: 1, day_of_week: "monday", sets: 3, reps: 5, weight: 315)
 RoutineExercise.create(routine_id: 3, exercise_id: 4, day_of_week: "wednesday",sets: 5, reps: 8, weight: 135)
