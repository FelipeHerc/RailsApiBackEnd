require 'test_helper'

class SectorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sector = sectors(:one)
  end

  test "should get index" do
    get sectors_url, as: :json
    assert_response :success
  end

  test "should create sector" do
    assert_difference('Sector.count') do
      post sectors_url, params: { sector: { name: @sector.name } }, as: :json
    end

    assert_response 201
  end

  test "should show sector" do
    get sector_url(@sector), as: :json
    assert_response :success
  end

  test "should update sector" do
    patch sector_url(@sector), params: { sector: { name: @sector.name } }, as: :json
    assert_response 200
  end

  test "should destroy sector" do
    assert_difference('Sector.count', -1) do
      delete sector_url(@sector), as: :json
    end

    assert_response 204
  end
end
