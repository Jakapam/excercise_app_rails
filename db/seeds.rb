# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  #Users

  User.create(first_name: "Justin", last_name: "Man", username: "test1", password: "test1", email: "test1@test.com")
  User.create(first_name: "Ben", last_name: "Lea", username: "test2", password: "test2", email: "test2@test.com")
  User.create(first_name: "Mister", last_name: "Man", username: "test3", password: "test3", email: "test3@test.com")

 # Exercises

  Exercise.create(name: "Bench Press")
  Exercise.create(name: "Squats")
  Exercise.create(name: "Shoulder Press")
  Exercise.create(name: "Bicep Curls")
  Exercise.create(name: "Deadlifts")

#challenges

  Challenge.create(challenger_id: 1, challengee_id: 3, exercise_id: 5, sets: 1, reps: 1, weight: 1000)
  Challenge.create(challenger_id: 3, challengee_id: 1, exercise_id: 1, sets: 1, reps: 1, weight: 225)
  Challenge.create(challenger_id: 2, challengee_id: 1, exercise_id: 2, sets: 1, reps: 1, weight: 135)

 # Routines

 Routine.create(name: "Chest Burster", user_id: 1)
 Routine.create(name: "Legs for days", user_id: 2)
 Routine.create(name: "Arms", user_id: 3)

 #Exercise routines

 RoutineExercise.create(routine_id: 1, exercise_id: 1,  sets: 4, reps: 12, weight: 135, monday: true)
 RoutineExercise.create(routine_id: 2, exercise_id: 2,  sets: 4, reps: 10, weight: 135, friday: true)
 RoutineExercise.create(routine_id: 2, exercise_id: 1, sets: 3, reps: 5, weight: 315, monday: true, wednesday: true)
 RoutineExercise.create(routine_id: 3, exercise_id: 4, sets: 5, reps: 8, weight: 135, sunday: true, saturday: true)
