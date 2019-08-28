require 'test_helper'

class PossesionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @possesion = possesions(:one)
  end

  test "should get index" do
    get possesions_url, as: :json
    assert_response :success
  end

  test "should create possesion" do
    assert_difference('Possesion.count') do
      post possesions_url, params: { possesion: { equip: @possesion.equip, owner_id: @possesion.owner_id } }, as: :json
    end

    assert_response 201
  end

  test "should show possesion" do
    get possesion_url(@possesion), as: :json
    assert_response :success
  end

  test "should update possesion" do
    patch possesion_url(@possesion), params: { possesion: { equip: @possesion.equip, owner_id: @possesion.owner_id } }, as: :json
    assert_response 200
  end

  test "should destroy possesion" do
    assert_difference('Possesion.count', -1) do
      delete possesion_url(@possesion), as: :json
    end

    assert_response 204
  end
end
