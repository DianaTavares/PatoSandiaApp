u = User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)
e = Exercise.create(name: "multiplicacion", user_id: u.id)

 Text.create(exercise_id: e.id, x_position: 558, y_position: 91, text: "5 x 4 =")
 Input.create(exercise_id: e.id, x_position: 381, y_position: 91, answer: "20")

UserExercise.create(user_id: u.id, exercise_id: e.id, score: 1)

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password)
# end
