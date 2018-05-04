require 'test_helper'

class PcrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pcr = pcrs(:one)
  end

  test "should get index" do
    get pcrs_url
    assert_response :success
  end

  test "should get new" do
    get new_pcr_url
    assert_response :success
  end

  test "should create pcr" do
    assert_difference('Pcr.count') do
      post pcrs_url, params: { pcr: { board_id: @pcr.board_id, phase_id: @pcr.phase_id, when: @pcr.when, who: @pcr.who } }
    end

    assert_redirected_to pcr_url(Pcr.last)
  end

  test "should show pcr" do
    get pcr_url(@pcr)
    assert_response :success
  end

  test "should get edit" do
    get edit_pcr_url(@pcr)
    assert_response :success
  end

  test "should update pcr" do
    patch pcr_url(@pcr), params: { pcr: { board_id: @pcr.board_id, phase_id: @pcr.phase_id, when: @pcr.when, who: @pcr.who } }
    assert_redirected_to pcr_url(@pcr)
  end

  test "should destroy pcr" do
    assert_difference('Pcr.count', -1) do
      delete pcr_url(@pcr)
    end

    assert_redirected_to pcrs_url
  end
end
