class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.references :user, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
