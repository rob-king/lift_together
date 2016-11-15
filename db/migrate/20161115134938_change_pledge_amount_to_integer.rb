class ChangePledgeAmountToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :pledges, :amount, :integer
  end
end
