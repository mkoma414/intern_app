class CompaniesController < ApplicationController
  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
  end

  private
  def company_params
    params.require(:company).permit(:image)
  end

end
