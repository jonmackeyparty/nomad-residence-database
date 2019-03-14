class CreateRoommates < ActiveRecord::Migration
  def change
    create_table :roommates do |t|
      t.string :name
    end
  end
end
