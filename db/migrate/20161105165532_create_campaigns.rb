class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :description
      t.datetime :end_date
      t.string :organization
      t.integer :goal_amount
      t.integer :current_amount
      t.timestamps
    end
  end
end
