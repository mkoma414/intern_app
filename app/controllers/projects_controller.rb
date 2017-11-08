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

  def get_head_data

    @head_data = Project.all

    respond_to do |format|
      format.json { render json: @head_data}
    end
  end

end

  private
  def project_params
    params.require(:project).permit(:title, :content, :finding_person, :recruitment_style, :recruiting_feature, :image).merge(company_id: 1)
  end
