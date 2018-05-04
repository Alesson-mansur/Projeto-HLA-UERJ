require 'test_helper'

class DnanumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dnanum = dnanums(:one)
  end

  test "should get index" do
    get dnanums_url
    assert_response :success
  end

  test "should get new" do
    get new_dnanum_url
    assert_response :success
  end

  test "should create dnanum" do
    assert_difference('Dnanum.count') do
      post dnanums_url, params: { dnanum: { code: @dnanum.code, option: @dnanum.option, well: @dnanum.well } }
    end

    assert_redirected_to dnanum_url(Dnanum.last)
  end

  test "should show dnanum" do
    get dnanum_url(@dnanum)
    assert_response :success
  end

  test "should get edit" do
    get edit_dnanum_url(@dnanum)
    assert_response :success
  end

  test "should update dnanum" do
    patch dnanum_url(@dnanum), params: { dnanum: { code: @dnanum.code, option: @dnanum.option, well: @dnanum.well } }
    assert_redirected_to dnanum_url(@dnanum)
  end

  test "should destroy dnanum" do
    assert_difference('Dnanum.count', -1) do
      delete dnanum_url(@dnanum)
    end

    assert_redirected_to dnanums_url
  end
end
