class CreateUsername < ActiveRecord::Migration
  def change
    add_column :nomads, :username, :string
  end
end
