u = User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)
e = Exercise.create(name: "uno", file:"uno.html", user_id: u.id)

 Answer.create!(value: "6", exercise_id: e.id)
 Answer.create(value: "papa", exercise_id: e.id)

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
