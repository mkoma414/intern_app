class CreateGoodProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :good_projects do |t|
      t.references :user, forengn_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
