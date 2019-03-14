class CreateNomads < ActiveRecord::Migration
  def change
    create_table :nomads do |t|
      t.string :name
      t.string :password_digest
    end      
  end
end
