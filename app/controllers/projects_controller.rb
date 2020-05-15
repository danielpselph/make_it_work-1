class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:project_id])
  end

  def add_contestant
    project = Project.find(params[:project_id])
    contestant = Contestant.find(params[:contestant_id])
    #test passing without line below, need to get clarification
    # ContestantProject.create(contestant_id: contestant.id, project_id: project.id)
    redirect_to "/projects/#{project.id}"
  end
  
end