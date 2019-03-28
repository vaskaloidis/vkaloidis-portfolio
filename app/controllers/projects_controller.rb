class ProjectsController < AdminController
  # http_basic_authenticate_with name: @username, password: @password
  before_action :set_project, only: %i[show edit update destroy]
  before_action :authenticate

  # GET /projects
  # GET /projects.json
  def index
    @projectsEnabled = Project.order(order: :DESC).where(displayed: true)
    @projectsDisabled = Project.where(displayed: false)
  end

  # GET /projects/1
  # GET /projects/1.json
  def view;
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

  def edit;
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

  private

  def authenticate
    super
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:name, :categories, :content, :order, :displayed, :markdown, :image, :sticky, :website, :large_modal, :image_dir)
    # project = params[:project]
    # project[:content] = (project[:content]).strip
    # params[:project].merge!(project)
  end
end
