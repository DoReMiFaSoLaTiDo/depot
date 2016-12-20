require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
    @ruby_book = products(:ruby)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      # post :create, product: { :title => @update.title, description: @update.description, image_url: @update.image_url, price: @update.price }
      post :create, line_item: { product_id: products(:ruby).id }
      # post line_items_path, params: {product_id: products(:ruby).id }
    end

    follow_redirect!
    # get :line_item_path
    # assert_select '#cart', 'Your Pragmatic Cart'
    assert_select 'tr#current_item td', 'Programming Ruby 1.9'

  end

  test "should show line_item" do
    get :show, id: @line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_item
    assert_response :success
  end

  test "should update line_item" do
    patch :update, id: @line_item, line_item: { cart_id: @line_item.cart_id, product_id: @line_item.product_id }
    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete :destroy, id: @line_item
    end

    assert_redirected_to line_items_path
  end

  test "should create line_item via ajax" do
    assert_difference('LineItem.count') do
      post :create, line_item: { product_id: products(:ruby).id }, xhr: true
    end

    assert_response :success
    assert_select_jquery :html, '#cart' do
      assert_select 'tr#current_item td', /Programming Ruby 1.9/
    end
  end
end
