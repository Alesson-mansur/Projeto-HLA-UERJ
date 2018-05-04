require 'test_helper'

class RelatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @relat = relats(:one)
  end

  test "should get index" do
    get relats_url
    assert_response :success
  end

  test "should get new" do
    get new_relat_url
    assert_response :success
  end

  test "should create relat" do
    assert_difference('Relat.count') do
      post relats_url, params: { relat: { board_id: @relat.board_id, phase_id: @relat.phase_id, when: @relat.when, who: @relat.who } }
    end

    assert_redirected_to relat_url(Relat.last)
  end

  test "should show relat" do
    get relat_url(@relat)
    assert_response :success
  end

  test "should get edit" do
    get edit_relat_url(@relat)
    assert_response :success
  end

  test "should update relat" do
    patch relat_url(@relat), params: { relat: { board_id: @relat.board_id, phase_id: @relat.phase_id, when: @relat.when, who: @relat.who } }
    assert_redirected_to relat_url(@relat)
  end

  test "should destroy relat" do
    assert_difference('Relat.count', -1) do
      delete relat_url(@relat)
    end

    assert_redirected_to relats_url
  end
end
