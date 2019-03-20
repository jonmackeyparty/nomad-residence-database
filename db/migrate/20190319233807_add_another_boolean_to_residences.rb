class AddAnotherBooleanToResidences < ActiveRecord::Migration
  def change
    add_column :residences, :deposit_refunded, :boolean, null: false, default: false
  end
end
