class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title,          null: false
      t.text :content,          null: false
      t.text :finding_person
      t.text :recruitment_style
      t.text :recruiting_feature

      t.timestamps
    end
  end
end
