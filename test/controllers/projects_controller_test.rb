require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = create(:project, markdown: false)
    @project_md = create(:project, markdown: true)
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

  test 'should create html project' do
    assert_difference('Project.count') do
      post projects_url, params: { project: attributes_for(:project, markdown: false) }, headers: headers
    end
    assert_redirected_to project_url(Project.last)
    check_homepage
  end

  test 'should create markdown project' do
    assert_difference('Project.count') do
      post projects_url, params: { project: attributes_for(:project, markdown: true) }, headers: headers
    end
    assert_redirected_to project_url(Project.last)
    check_homepage
  end

  test 'should show project' do
    get project_url(@project), headers: headers
    assert_response :success
    check_homepage
  end

  test 'should get edit' do
    get edit_project_url(@project), headers: headers
    assert_response :success
    check_homepage
  end

  test 'should update html and md project' do
    update_params = { name: 'new-name',
                      content: 'this is new content',
                      markdown: false,
                      sticky: true,
                      displayed: true }
    patch project_url(@project), params: { project: update_params }, headers: headers
    assert_response :success
    get project_url(@project), headers: headers
    assert_response :success
    get edit_project_url(@project), headers: headers
    assert_response :success
    check_homepage
  end

  test 'should update markdown project' do
    update_params = { name: 'new-name',
                      content: 'this is new content',
                      markdown: true,
                      sticky: true,
                      displayed: true }
    patch project_url(@project), params: { project: update_params }, headers: headers
    assert_response :success
    get project_url(@project), headers: headers
    assert_response :success
    get edit_project_url(@project), headers: headers
    assert_response :success
    check_homepage
  end

  test 'should destroy project' do
    assert_difference('Project.count', -1) do
      delete project_url(@project), headers: headers
    end
    assert_redirected_to projects_url
    check_homepage
  end

  def check_homepage
    get root_url
    assert_response :success
  end

  protected

  def headers
    # TODO: Move this somewhere higher-up eventually
    { 'Authorization' => "Basic #{Base64.encode64('vas:password')}" }
  end
end
