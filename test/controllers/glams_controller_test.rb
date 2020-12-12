require 'test_helper'

class GlamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @glam = glams(:one)
  end

  test "should get index" do
    get glams_url, as: :json
    assert_response :success
  end

  test "should create glam" do
    assert_difference('Glam.count') do
      post glams_url, params: { glam: { artist_id: @glam.artist_id, glam_squad: @glam.glam_squad, hair: @glam.hair, makeup: @glam.makeup, wardrobe: @glam.wardrobe } }, as: :json
    end

    assert_response 201
  end

  test "should show glam" do
    get glam_url(@glam), as: :json
    assert_response :success
  end

  test "should update glam" do
    patch glam_url(@glam), params: { glam: { artist_id: @glam.artist_id, glam_squad: @glam.glam_squad, hair: @glam.hair, makeup: @glam.makeup, wardrobe: @glam.wardrobe } }, as: :json
    assert_response 200
  end

  test "should destroy glam" do
    assert_difference('Glam.count', -1) do
      delete glam_url(@glam), as: :json
    end

    assert_response 204
  end
end
