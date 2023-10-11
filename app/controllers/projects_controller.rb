class ProjectsController < AdminController
  after_action :allow_iframe, only: %i[view view_raw]
  # http_basic_authenticate_with name: @username, password: @password
  before_action :set_project, only: %i[show edit update destroy]
  before_action :set_project_shortname, only: %i[view view_raw]
  before_action :authenticate, except: %i[view view_raw]
  before_action :populate_image_directories

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

  # GET /projects
  # GET /projects.json
  def index
    @projectsEnabled = Project.order(order: :DESC).where(displayed: true)
    @projectsDisabled = Project.where(displayed: false)
  end

  def populate_image_directories
    @directories = []
    project_dirs = Rails.root.join('public', 'projects')
    Dir.entries(project_dirs).sort_by! {|filename| filename.downcase}.each do |item|
      next if item == '.' or item == '..' or item == '.DS_Store'
      @directories << item
    end
  end

  def view

  end

  def view_raw
    render(:layout => "layouts/raw_application")
  end

  def set_project_shortname
    @project = Project.where(shortname: params[:shortname]).first
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

  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.content = @project.content.strip
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

  # Updates the Project and Forwards the user after
  # TODO: Merge with save and only redirect based on whether update o save button perssed
  #
  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project.update(project_params)
    @project.update(content: @project.content.strip)
    respond_to do |format|
      if  @project.valid?
        format.html {render :edit, notice: 'Project was successfully Saved.'}
        format.json {render :show, status: :ok, location: @project}
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

  def project_params
    params.require(:project).permit(:name, :shortname, :categories, :content, :order, :displayed, :markdown, :image, :sticky, :website, :large_modal, :image_dir, :source_code)
    # project = params[:project]
    # project[:content] = (project[:content]).strip
    # params[:project].merge!(project)
  end

  private

  def authenticate
    super
  end

  def set_project
    @project = Project.find(params[:id])
  end

end
