require 'test_helper'

class ImportsControllerTest < ActionController::TestCase
  test "should list past importings list" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imports)
  end

  test "should get new importing form" do
    get :new
    assert_response :success
  end

  test "should perform an importing" do
    assert_difference('Import.count') do
      file_path = Rails.root.join("test", "fixtures", "example_input.tab")
      uploaded_file = Rack::Test::UploadedFile.new(file_path, "text/plain")
      post :create, import: { file: uploaded_file }
    end

    assert_equal 3, User.count
    assert_not_nil User.find_by_name("Snake Plissken")

    assert_equal 3, Merchant.count
    merchant = Merchant.find_by_name("Sneaker Store Emporium")
    assert_equal '123 Fake St', merchant.address
    assert_equal 1, merchant.items.count

    assert_redirected_to imports_path
  end
end
