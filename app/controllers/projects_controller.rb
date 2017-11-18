class ProjectsController < ApplicationController
  def index
    @projects = Project.where('id > 5')
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

    @head_data = Project.where('id < 6')

    respond_to do |format|
      format.json
    end
  end

end

  private
  def project_params
    params.require(:project).permit(:title, :content, :finding_person, :recruitment_style, :recruiting_feature, :image).merge(company_id: 1)
  end
