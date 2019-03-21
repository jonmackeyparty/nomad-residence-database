class AddLineItemColumnForDebt < ActiveRecord::Migration
  def change
    add_column :roommate_to_nomad_loans, :line_item, :string
  end
end
