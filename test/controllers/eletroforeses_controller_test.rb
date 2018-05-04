require 'test_helper'

class EletroforesesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eletroforese = eletroforeses(:one)
  end

  test "should get index" do
    get eletroforeses_url
    assert_response :success
  end

  test "should get new" do
    get new_eletroforese_url
    assert_response :success
  end

  test "should create eletroforese" do
    assert_difference('Eletroforese.count') do
      post eletroforeses_url, params: { eletroforese: { board_id: @eletroforese.board_id, phase_id: @eletroforese.phase_id, when: @eletroforese.when, who: @eletroforese.who } }
    end

    assert_redirected_to eletroforese_url(Eletroforese.last)
  end

  test "should show eletroforese" do
    get eletroforese_url(@eletroforese)
    assert_response :success
  end

  test "should get edit" do
    get edit_eletroforese_url(@eletroforese)
    assert_response :success
  end

  test "should update eletroforese" do
    patch eletroforese_url(@eletroforese), params: { eletroforese: { board_id: @eletroforese.board_id, phase_id: @eletroforese.phase_id, when: @eletroforese.when, who: @eletroforese.who } }
    assert_redirected_to eletroforese_url(@eletroforese)
  end

  test "should destroy eletroforese" do
    assert_difference('Eletroforese.count', -1) do
      delete eletroforese_url(@eletroforese)
    end

    assert_redirected_to eletroforeses_url
  end
end
