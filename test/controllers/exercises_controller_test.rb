require 'test_helper'

class ExercisesControllerTest < ActionDispatch::IntegrationTest
  test "should get new-exercise" do
    get exercises_new-exercise_url
    assert_response :success
  end

end
