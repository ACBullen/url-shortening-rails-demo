class AddPremiumMembershipCol < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.boolean :premium, default: false, null: false
    end
  end
end
