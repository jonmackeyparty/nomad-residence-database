class AddColumnsToRoommateToNomadLoans < ActiveRecord::Migration
  def change
      add_column :roommate_to_nomad_loans, :nomad_id, :integer
      add_column :roommate_to_nomad_loans, :roommate_id, :integer
  end
end
