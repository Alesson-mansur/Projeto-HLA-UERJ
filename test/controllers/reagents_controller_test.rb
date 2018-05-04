require 'test_helper'

class ReagentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reagent = reagents(:one)
  end

  test "should get index" do
    get reagents_url
    assert_response :success
  end

  test "should get new" do
    get new_reagent_url
    assert_response :success
  end

  test "should create reagent" do
    assert_difference('Reagent.count') do
      post reagents_url, params: { reagent: { amplific: @reagent.amplific, board_id: @reagent.board_id, campo10: @reagent.campo10, campo11: @reagent.campo11, campo12: @reagent.campo12, campo13: @reagent.campo13, campo14: @reagent.campo14, campo15: @reagent.campo15, campo16: @reagent.campo16, campo17: @reagent.campo17, campo18: @reagent.campo18, campo19: @reagent.campo19, campo1: @reagent.campo1, campo20: @reagent.campo20, campo21: @reagent.campo21, campo22: @reagent.campo22, campo23: @reagent.campo23, campo24: @reagent.campo24, campo2: @reagent.campo2, campo3: @reagent.campo3, campo4: @reagent.campo4, campo5: @reagent.campo5, campo6: @reagent.campo6, campo7: @reagent.campo7, campo8: @reagent.campo8, campo9: @reagent.campo9, data12: @reagent.data12, data13: @reagent.data13, data14: @reagent.data14, data15: @reagent.data15, data16: @reagent.data16, data17: @reagent.data17, data18: @reagent.data18, data19: @reagent.data19, data1: @reagent.data1, data20: @reagent.data20, data23: @reagent.data23, data24: @reagent.data24, data2: @reagent.data2, data3: @reagent.data3, data4: @reagent.data4, data5: @reagent.data5, data6: @reagent.data6, data7: @reagent.data7, data8: @reagent.data8, data9: @reagent.data9, image: @reagent.image, obs: @reagent.obs } }
    end

    assert_redirected_to reagent_url(Reagent.last)
  end

  test "should show reagent" do
    get reagent_url(@reagent)
    assert_response :success
  end

  test "should get edit" do
    get edit_reagent_url(@reagent)
    assert_response :success
  end

  test "should update reagent" do
    patch reagent_url(@reagent), params: { reagent: { amplific: @reagent.amplific, board_id: @reagent.board_id, campo10: @reagent.campo10, campo11: @reagent.campo11, campo12: @reagent.campo12, campo13: @reagent.campo13, campo14: @reagent.campo14, campo15: @reagent.campo15, campo16: @reagent.campo16, campo17: @reagent.campo17, campo18: @reagent.campo18, campo19: @reagent.campo19, campo1: @reagent.campo1, campo20: @reagent.campo20, campo21: @reagent.campo21, campo22: @reagent.campo22, campo23: @reagent.campo23, campo24: @reagent.campo24, campo2: @reagent.campo2, campo3: @reagent.campo3, campo4: @reagent.campo4, campo5: @reagent.campo5, campo6: @reagent.campo6, campo7: @reagent.campo7, campo8: @reagent.campo8, campo9: @reagent.campo9, data12: @reagent.data12, data13: @reagent.data13, data14: @reagent.data14, data15: @reagent.data15, data16: @reagent.data16, data17: @reagent.data17, data18: @reagent.data18, data19: @reagent.data19, data1: @reagent.data1, data20: @reagent.data20, data23: @reagent.data23, data24: @reagent.data24, data2: @reagent.data2, data3: @reagent.data3, data4: @reagent.data4, data5: @reagent.data5, data6: @reagent.data6, data7: @reagent.data7, data8: @reagent.data8, data9: @reagent.data9, image: @reagent.image, obs: @reagent.obs } }
    assert_redirected_to reagent_url(@reagent)
  end

  test "should destroy reagent" do
    assert_difference('Reagent.count', -1) do
      delete reagent_url(@reagent)
    end

    assert_redirected_to reagents_url
  end
end
