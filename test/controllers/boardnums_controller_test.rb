require 'test_helper'

class BoardnumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boardnum = boardnums(:one)
  end

  test "should get index" do
    get boardnums_url
    assert_response :success
  end

  test "should get new" do
    get new_boardnum_url
    assert_response :success
  end

  test "should create boardnum" do
    assert_difference('Boardnum.count') do
      post boardnums_url, params: { boardnum: { identification: @boardnum.identification } }
    end

    assert_redirected_to boardnum_url(Boardnum.last)
  end

  test "should show boardnum" do
    get boardnum_url(@boardnum)
    assert_response :success
  end

  test "should get edit" do
    get edit_boardnum_url(@boardnum)
    assert_response :success
  end

  test "should update boardnum" do
    patch boardnum_url(@boardnum), params: { boardnum: { identification: @boardnum.identification } }
    assert_redirected_to boardnum_url(@boardnum)
  end

  test "should destroy boardnum" do
    assert_difference('Boardnum.count', -1) do
      delete boardnum_url(@boardnum)
    end

    assert_redirected_to boardnums_url
  end
end
