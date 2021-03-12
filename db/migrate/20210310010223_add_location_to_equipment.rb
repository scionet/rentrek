class AddLocationToEquipment < ActiveRecord::Migration[6.0]
  def change
    add_column :equipment, :location, :string
  end
end
