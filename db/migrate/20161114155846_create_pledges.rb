class CreatePledges < ActiveRecord::Migration[5.0]
  def change
    create_table :pledges do |t|
      t.references :campaign, foreign_key: true
      t.references :user, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
