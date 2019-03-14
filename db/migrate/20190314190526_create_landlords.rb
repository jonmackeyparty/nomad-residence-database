class CreateLandlords < ActiveRecord::Migration
  def change
    create_table :landlords do |t|
      t.string :name
    end
  end
end
