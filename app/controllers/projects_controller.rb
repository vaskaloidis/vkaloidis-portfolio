class ProjectsController < AdminController

  # http_basic_authenticate_with name: @username, password: @password
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, only: [:new, :edit, :create, :update, :destroy]


  # GET /projects
  # GET /projects.json
  def index
    @projectsEnabled = Project.order(order: :DESC).where(displayed: true)
    @projectsDisabled = Project.where(displayed: false)
  end

  # GET /projects/1
  # GET /projects/1.json
  def view
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @project}
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
    # calculateInfo # ?????
  end

  # GET /projects/1/edit

  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html {redirect_to @project, notice: 'Project was successfully created.'}
        format.json {render :show, status: :created, location: @project}
      else
        format.html {render :new}
        format.json {render json: @project.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /save_project/1
  # PATCH/PUT /save_project/1.json
  def save
    respond_to do |format|
      if @project.update(project_params)

        @project.markdown = @project.markdown.to_s.strip
        @project.content = @project.content.to_s.strip
        if @project.save
          format.html {redirect_to edit_project_path(@project), notice: 'Project was succesfully Saved'}
          format.json {render :show, status: :ok, location: @project}
        else
          format.html {render :edit}
          format.json {render json: @project.errors, status: :unprocessable_entity}
        end
      else
        format.html {render :edit}
        format.json {render json: @project.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)

        @project.markdown = @project.markdown.to_s.strip
        @project.content = @project.content.to_s.strip

        if @project.save
          format.html {redirect_to edit_project_path(@project), notice: 'Project was succesfully Saved'}
          format.json {render :show, status: :ok, location: @project}
        else
          format.html {render :edit}
          format.json {render json: @project.errors, status: :unprocessable_entity}
        end

      else
        format.html {render :edit}
        format.json {render json: @project.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html {redirect_to projects_url, notice: 'Project was successfully destroyed.'}
      format.json {head :no_content}
    end
  end


  private
  def authenticate
    super
  end

  def authenticate_two
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |user_name, password|
        session[:admin] = (user_name == 'vas' && password == ENV['password'])
      end
    else
      Dotenv::Railtie.load
      authenticate_or_request_with_http_basic do |user_name, password|
        session[:admin] = (user_name == 'vas' && password == 'password')
      end
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:name, :categories, :content, :order, :displayed, :markdown, :image, :sticky, :website, :large_modal, :image_dir)
  end
end
