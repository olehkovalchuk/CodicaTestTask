class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments, id: :uuid do |t|
      t.text :recommendation, default: ""
      t.integer :status, null: false, default: 0
      t.references :doctor, type: :uuid, null: false, foreign_key: { to_table: :users }
      t.references :patient, type: :uuid, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
