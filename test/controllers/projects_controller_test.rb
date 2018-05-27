require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = create(:project)
  end

  test 'authentication' do
    get projects_url
    assert_response 401
    get projects_url, headers: headers
    assert_response :success
  end

  test 'should get index' do
    get projects_url, headers: headers
    assert_response :success
  end

  test 'should get new' do
    get new_project_url, headers: headers
    assert_response :success
  end

  test 'should create project' do
    assert_difference('Project.count') do
      post projects_url, params: { project: attributes_for(:project) }, headers: headers
    end
    assert_redirected_to project_url(Project.last)
  end

  test 'should show project' do
    get project_url(@project), headers: headers
    assert_response :success
  end

  test 'should get edit' do
    get edit_project_url(@project), headers: headers
    assert_response :success
  end

  test 'should update project' do
    update_params = { name: 'new-name',
                      content: 'this is new content',
                      markdown_content: 'more markdown content',
                      sticky: true,
                      displayed: true }
    patch project_url(@project), params: { project: update_params }, headers: headers
    assert_redirected_to edit_project_url(@project)
  end

  test 'should destroy project' do
    assert_difference('Project.count', -1) do
      delete project_url(@project), headers: headers
    end
    assert_redirected_to projects_url
  end

  protected

  def headers
    { 'Authorization' => "Basic #{Base64.encode64('vas:password')}" }
  end
end
