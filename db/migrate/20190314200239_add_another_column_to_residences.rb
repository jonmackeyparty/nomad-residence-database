class AddAnotherColumnToResidences < ActiveRecord::Migration
  def change
    add_column :residences, :nomad_id, :integer
  end
end
