require "test_helper"

class SellsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sell = sells(:one)
  end

  test "should get index" do
    get sells_url
    assert_response :success
  end

  test "should get new" do
    get new_sell_url
    assert_response :success
  end

  test "should create sell" do
    assert_difference("Sell.count") do
      post sells_url, params: { sell: { content: @sell.content, email: @sell.email, lastName: @sell.lastName, locality_id: @sell.locality_id, name: @sell.name, phone: @sell.phone } }
    end

    assert_redirected_to sell_url(Sell.last)
  end

  test "should show sell" do
    get sell_url(@sell)
    assert_response :success
  end

  test "should get edit" do
    get edit_sell_url(@sell)
    assert_response :success
  end

  test "should update sell" do
    patch sell_url(@sell), params: { sell: { content: @sell.content, email: @sell.email, lastName: @sell.lastName, locality_id: @sell.locality_id, name: @sell.name, phone: @sell.phone } }
    assert_redirected_to sell_url(@sell)
  end

  test "should destroy sell" do
    assert_difference("Sell.count", -1) do
      delete sell_url(@sell)
    end

    assert_redirected_to sells_url
  end
end
