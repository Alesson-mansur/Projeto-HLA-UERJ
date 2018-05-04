require 'test_helper'

class HibridsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hibrid = hibrids(:one)
  end

  test "should get index" do
    get hibrids_url
    assert_response :success
  end

  test "should get new" do
    get new_hibrid_url
    assert_response :success
  end

  test "should create hibrid" do
    assert_difference('Hibrid.count') do
      post hibrids_url, params: { hibrid: { board_id: @hibrid.board_id, phase_id: @hibrid.phase_id, when: @hibrid.when, who: @hibrid.who } }
    end

    assert_redirected_to hibrid_url(Hibrid.last)
  end

  test "should show hibrid" do
    get hibrid_url(@hibrid)
    assert_response :success
  end

  test "should get edit" do
    get edit_hibrid_url(@hibrid)
    assert_response :success
  end

  test "should update hibrid" do
    patch hibrid_url(@hibrid), params: { hibrid: { board_id: @hibrid.board_id, phase_id: @hibrid.phase_id, when: @hibrid.when, who: @hibrid.who } }
    assert_redirected_to hibrid_url(@hibrid)
  end

  test "should destroy hibrid" do
    assert_difference('Hibrid.count', -1) do
      delete hibrid_url(@hibrid)
    end

    assert_redirected_to hibrids_url
  end
end
