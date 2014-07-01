require 'test_helper'

class ScoretablesControllerTest < ActionController::TestCase
  setup do
    @scoretable = scoretables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scoretables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scoretable" do
    assert_difference('Scoretable.count') do
      post :create, scoretable: { name: @scoretable.name, time: @scoretable.time }
    end

    assert_redirected_to scoretable_path(assigns(:scoretable))
  end

  test "should show scoretable" do
    get :show, id: @scoretable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scoretable
    assert_response :success
  end

  test "should update scoretable" do
    patch :update, id: @scoretable, scoretable: { name: @scoretable.name, time: @scoretable.time }
    assert_redirected_to scoretable_path(assigns(:scoretable))
  end

  test "should destroy scoretable" do
    assert_difference('Scoretable.count', -1) do
      delete :destroy, id: @scoretable
    end

    assert_redirected_to scoretables_path
  end
end
