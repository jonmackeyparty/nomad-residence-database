class CreateNomadToRoommateLoans < ActiveRecord::Migration
  def change
    create_table :nomad_to_roommate_loans do |t|
      t.integer :amount
      t.date :date
    end
  end
end
