class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy change_status ]
  before_action :set_projects, only: %i[ new edit ]

  def index
    @activities = Activity.all
  end

  def show
  end

  def new
    @activity = Activity.new
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to activity_url(@activity), notice: "Atividade foi criada com sucesso!" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to activity_url(@activity), notice: "Atividade foi atualizada com sucesso!" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity.destroy


    respond_to do |format|
      format.html { redirect_to activities_url, notice: "Atividade foi apaga com sucesso." }
    end
  end

  def change_status
    @activity.toggle!(:finished)
    @activity.update_project
    if params[:origin] == 'activity'
      redirect_to activities_url
    else 
      redirect_to project_path(@activity.project)
    end 
  end

  private
    def set_activity
      @activity = Activity.find(params[:id] || params[:activity_id])
    end

    def activity_params
      params.require(:activity).permit(:name, :date_start, :date_end, :finished, :project_id)
    end

    def set_projects
      @projects = Project.all
    end
end
