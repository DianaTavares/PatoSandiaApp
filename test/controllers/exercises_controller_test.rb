require 'test_helper'

class ExercisesControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  test "should get new-exercise" do
    get exercises_new-exercise_url
=======
  test "should get new" do
    get exercises_new_url
>>>>>>> creacionDiana
    assert_response :success
  end

end
