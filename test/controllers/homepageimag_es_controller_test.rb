require 'test_helper'

class HomepageimagEsControllerTest < ActionController::TestCase
  setup do
    @homepageimage = homepageimages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:homepageimages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create homepageimage" do
    assert_difference('Homepageimage.count') do
      post :create, homepageimage: {  }
    end

    assert_redirected_to homepageimage_path(assigns(:homepageimage))
  end

  test "should show homepageimage" do
    get :show, id: @homepageimage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @homepageimage
    assert_response :success
  end

  test "should update homepageimage" do
    patch :update, id: @homepageimage, homepageimage: {  }
    assert_redirected_to homepageimage_path(assigns(:homepageimage))
  end

  test "should destroy homepageimage" do
    assert_difference('Homepageimage.count', -1) do
      delete :destroy, id: @homepageimage
    end

    assert_redirected_to homepageimages_path
  end
end
