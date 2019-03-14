class CreateRoommateToNomadLoans < ActiveRecord::Migration
  def change
    create_table :roommate_to_nomad_loans do |t|
      t.integer :amount
      t.date :date
    end
  end
end
