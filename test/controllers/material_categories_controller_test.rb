require 'test_helper'

class MaterialCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get material_categories_index_url
    assert_response :success
  end

end
