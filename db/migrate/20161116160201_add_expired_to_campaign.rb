class AddExpiredToCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :expired, :boolean, null: false, default: false
  end
end
