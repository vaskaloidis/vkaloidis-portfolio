require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = create(:category)
  end

  test 'should get index' do
    get categories_url, headers: headers
    assert_response :success
  end

  test 'should get new' do
    get new_category_url, headers: headers
    assert_response :success
  end

  test 'should create category' do
    assert_difference('Category.count') do
      post categories_url, params: { category: attributes_for(:category) }, headers: headers
    end

    assert_redirected_to category_url(Category.last)
  end

  test 'should show category' do
    get category_url(@category), headers: headers
    assert_response :success
  end

  test 'should get edit' do
    get edit_category_url(@category), headers: headers
    assert_response :success
  end

  test 'should update category' do
    patch category_url(@category), params: { category: { name: 'new-name', code: 'new-cat-code', html: 'fa fa-new-icon' } }, headers: headers
    assert_redirected_to category_url(@category)
  end

  test 'should destroy category' do
    assert_difference('Category.count', -1) do
      delete category_url(@category), headers: headers
    end

    assert_redirected_to categories_url
  end

  protected

  def headers
    { 'Authorization' => "Basic #{Base64.encode64('vas:password')}" }
  end
end
