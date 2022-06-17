class ProjectsController < ApplicationController
  before_action :set_project, only: [ :edit, :update, :destroy ]

  def index
    if params[:title] 
      @projects = Project.where('title LIKE ?', "%#{params[:title]}%")
    else 
      @projects = Project.all
    end 
  end

  def show
    @project = Project.includes(:activities).find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: "Projeto criado com sucesso!" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Projeto foi atualizado com sucesso!" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: "Projeto foi apagado com sucesso."
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description, :date_start, :date_end)
    end
end
