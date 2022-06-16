class ApplicationController < ActionController::Base
  before_action :exists_project

  def exists_project
    @exists_project = Project.all.size > 0 
  end
end
