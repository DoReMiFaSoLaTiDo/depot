require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @update = products(:one).tap do |p|
      p.title = 'Lorem Ipsum',
      p.description = 'Wibbles are fun!',
      p.image_url = 'lorem.jpg'
      p.price  = 19.95
    end
    # @update[:title] =  'Lorem Ipsum'
    # @update[:description] = 'Wibbles are fun!',
    # @update[:image_url] = 'lorem.jpg'
    # @update[:price] = 19.95

  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { :title => @update.title, description: @update.description, image_url: @update.image_url, price: @update.price }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { description: @update.description, image_url: @update.image_url, price: @update.price, title: @product.title }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      item = LineItem.find_by(product_id: @product)
      LineItem.find_by(product_id: @product).destroy_all if item
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end

  # test "can't delete products in a cart" do
  #   assert_difference('Product.count', 0) do
  #     delete :destroy, id: products(:two)
  #   end
  #
  #   assert_redirected_to products_url
  # end
end
