require 'test_helper'

class ChipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chip = chips(:one)
  end

  test "should get index" do
    get chips_url, as: :json
    assert_response :success
  end

  test "should create chip" do
    assert_difference('Chip.count') do
      post chips_url, params: { chip: { ddd: @chip.ddd, operator: @chip.operator, phoneNumber: @chip.phoneNumber, stat_id: @chip.stat_id, value: @chip.value } }, as: :json
    end

    assert_response 201
  end

  test "should show chip" do
    get chip_url(@chip), as: :json
    assert_response :success
  end

  test "should update chip" do
    patch chip_url(@chip), params: { chip: { ddd: @chip.ddd, operator: @chip.operator, phoneNumber: @chip.phoneNumber, stat_id: @chip.stat_id, value: @chip.value } }, as: :json
    assert_response 200
  end

  test "should destroy chip" do
    assert_difference('Chip.count', -1) do
      delete chip_url(@chip), as: :json
    end

    assert_response 204
  end
end
