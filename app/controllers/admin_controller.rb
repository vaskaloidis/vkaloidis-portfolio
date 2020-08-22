class AdminController < ApplicationController
  before_action :authenticate, except: :view

  def index
    @projectsEnabled = Project.order(order: :DESC).where(displayed: true)
    @projectsDisabled = Project.where(displayed: false)
  end

  def login
    # Nothing
  end

  def logout
    reset_session
  end

  private
  def authenticate
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |user_name, password|
        session[:admin] = (user_name == 'vas' && password == ENV['PASSWORD'])
      end
    else
      Dotenv::Railtie.load
      authenticate_or_request_with_http_basic do |user_name, password|
        session[:admin] = (user_name == 'vas' && password == 'password')
      end
    end
  end

end
