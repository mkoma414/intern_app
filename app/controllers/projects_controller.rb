class ProjectsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
    else
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

  private
  def project_params
    params.require(:project).permit(:title, :content, :finding_person, :recruitment_style, :recruiting_feature, :image)
  end
