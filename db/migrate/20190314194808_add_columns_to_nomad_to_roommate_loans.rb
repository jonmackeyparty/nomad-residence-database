class AddColumnsToNomadToRoommateLoans < ActiveRecord::Migration
  def change
    add_column :nomad_to_roommate_loans, :nomad_id, :integer
    add_column :nomad_to_roommate_loans, :roommate_id, :integer
  end
end
