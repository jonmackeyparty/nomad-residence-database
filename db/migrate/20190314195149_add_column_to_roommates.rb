class AddColumnToRoommates < ActiveRecord::Migration
  def change
    add_column :roommates, :residence_id, :integer
  end
end
