require 'test_helper'

class InterpretsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interpret = interprets(:one)
  end

  test "should get index" do
    get interprets_url
    assert_response :success
  end

  test "should get new" do
    get new_interpret_url
    assert_response :success
  end

  test "should create interpret" do
    assert_difference('Interpret.count') do
      post interprets_url, params: { interpret: { board_id: @interpret.board_id, phase_id: @interpret.phase_id, when: @interpret.when, who: @interpret.who } }
    end

    assert_redirected_to interpret_url(Interpret.last)
  end

  test "should show interpret" do
    get interpret_url(@interpret)
    assert_response :success
  end

  test "should get edit" do
    get edit_interpret_url(@interpret)
    assert_response :success
  end

  test "should update interpret" do
    patch interpret_url(@interpret), params: { interpret: { board_id: @interpret.board_id, phase_id: @interpret.phase_id, when: @interpret.when, who: @interpret.who } }
    assert_redirected_to interpret_url(@interpret)
  end

  test "should destroy interpret" do
    assert_difference('Interpret.count', -1) do
      delete interpret_url(@interpret)
    end

    assert_redirected_to interprets_url
  end
end
