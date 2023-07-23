require "test_helper"

class RostersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @roster = rosters(:one)
  end

  test "should get index" do
    get rosters_url, as: :json
    assert_response :success
  end

  test "should create roster" do
    assert_difference("Roster.count") do
      post rosters_url, params: { roster: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show roster" do
    get roster_url(@roster), as: :json
    assert_response :success
  end

  test "should update roster" do
    patch roster_url(@roster), params: { roster: {  } }, as: :json
    assert_response :success
  end

  test "should destroy roster" do
    assert_difference("Roster.count", -1) do
      delete roster_url(@roster), as: :json
    end

    assert_response :no_content
  end
end
