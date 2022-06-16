class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy change_status ]
  before_action :set_projects, only: %i[ new edit ]

  # GET /activities or /activities.json
  def index
    @activities = Activity.all
  end

  # GET /activities/1 or /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities or /activities.json
  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to activity_url(@activity), notice: "Atividade foi criada com sucesso!" }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to activity_url(@activity), notice: "Atividade foi atualizada com sucesso!" }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id] || params[:activity_id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:name, :date_start, :date_end, :finished, :project_id)
    end

    def set_projects
      @projects = Project.all
    end
end
