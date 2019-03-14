class CreateResidences < ActiveRecord::Migration
  def change
    create_table :residences do |t|
      t.string :address
      t.integer :deposit
    end
  end
end
