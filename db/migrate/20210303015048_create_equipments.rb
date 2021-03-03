class CreateEquipments < ActiveRecord::Migration[6.0]
  def change
    create_table :equipments do |t|
      t.string :name
      t.text :description
      t.float :price_per_day
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean, :available, true

      t.timestamps
    end
  end
end
