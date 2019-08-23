require 'test_helper'

class CelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cel = cels(:one)
  end

  test "should get index" do
    get cels_url, as: :json
    assert_response :success
  end

  test "should create cel" do
    assert_difference('Cel.count') do
      post cels_url, params: { cel: { brand: @cel.brand, imei1: @cel.imei1, imei2: @cel.imei2, model: @cel.model, stat_id: @cel.stat_id } }, as: :json
    end

    assert_response 201
  end

  test "should show cel" do
    get cel_url(@cel), as: :json
    assert_response :success
  end

  test "should update cel" do
    patch cel_url(@cel), params: { cel: { brand: @cel.brand, imei1: @cel.imei1, imei2: @cel.imei2, model: @cel.model, stat_id: @cel.stat_id } }, as: :json
    assert_response 200
  end

  test "should destroy cel" do
    assert_difference('Cel.count', -1) do
      delete cel_url(@cel), as: :json
    end

    assert_response 204
  end
end
