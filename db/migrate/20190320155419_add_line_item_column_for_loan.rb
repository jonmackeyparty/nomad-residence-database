class AddLineItemColumnForLoan < ActiveRecord::Migration
  def change
    add_column :nomad_to_roommate_loans, :line_item, :string
  end
end
