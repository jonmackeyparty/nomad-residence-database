class AddBoleanToResidences < ActiveRecord::Migration
  def change
    add_column :residences, :primary_residence, :boolean, null: false, default: false
  end
end
