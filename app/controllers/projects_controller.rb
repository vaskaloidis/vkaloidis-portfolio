class ProjectsController < AdminController

  # http_basic_authenticate_with name: @username, password: @password
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate


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
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        @project.markdown = @project.markdown.to_s.strip
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      # session[:admin] = (user_name == ENV['username'] && password == ENV['password'])
      session[:admin] = (user_name == 'vas' && password == 'Maxima2016!')

    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:name, :categories, :content, :order, :displayed, :markdown, :image, :sticky, :website)
  end
end
