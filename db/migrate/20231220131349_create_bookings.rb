class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :status
      t.string :first_name
      t.string :last_name
      t.string :email
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :customer_paid
      t.references :time_slot, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
