require 'test_helper'

class WurlsControllerTest < ActionController::TestCase
  setup do
    @wurl = wurls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wurls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wurl" do
    assert_difference('Wurl.count') do
      post :create, wurl: { ourl: @wurl.ourl, turl: @wurl.turl }
    end

    assert_redirected_to wurl_path(assigns(:wurl))
  end

  test "should show wurl" do
    get :show, id: @wurl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wurl
    assert_response :success
  end

  test "should update wurl" do
    patch :update, id: @wurl, wurl: { ourl: @wurl.ourl, turl: @wurl.turl }
    assert_redirected_to wurl_path(assigns(:wurl))
  end

  test "should destroy wurl" do
    assert_difference('Wurl.count', -1) do
      delete :destroy, id: @wurl
    end

    assert_redirected_to wurls_path
  end
end
