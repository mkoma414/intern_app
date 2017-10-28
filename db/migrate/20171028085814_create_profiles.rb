class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.text :introduction,   null:false
      t.text :want_to_do
      t.text :history
      t.text :skill
      t.text :educational_background
      t.text :zeminar
      t.text :circle
      t.text :language
      t.text :qualification
      t.text :awards
      t.text :writing
      t.text :portfolio
      t.text :portfolio_image
      t.text :link
      t.text :topic
      t.text :basic
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
