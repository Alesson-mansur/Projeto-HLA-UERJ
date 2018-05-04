require 'test_helper'

class InterpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interp = interps(:one)
  end

  test "should get index" do
    get interps_url
    assert_response :success
  end

  test "should get new" do
    get new_interp_url
    assert_response :success
  end

  test "should create interp" do
    assert_difference('Interp.count') do
      post interps_url, params: { interp: { board_id: @interp.board_id, phase_id: @interp.phase_id, when: @interp.when, who: @interp.who } }
    end

    assert_redirected_to interp_url(Interp.last)
  end

  test "should show interp" do
    get interp_url(@interp)
    assert_response :success
  end

  test "should get edit" do
    get edit_interp_url(@interp)
    assert_response :success
  end

  test "should update interp" do
    patch interp_url(@interp), params: { interp: { board_id: @interp.board_id, phase_id: @interp.phase_id, when: @interp.when, who: @interp.who } }
    assert_redirected_to interp_url(@interp)
  end

  test "should destroy interp" do
    assert_difference('Interp.count', -1) do
      delete interp_url(@interp)
    end

    assert_redirected_to interps_url
  end
end
