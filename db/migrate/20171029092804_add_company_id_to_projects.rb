class AddCompanyIdToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :company_id, :integer, foreign_key: true
  end
end
