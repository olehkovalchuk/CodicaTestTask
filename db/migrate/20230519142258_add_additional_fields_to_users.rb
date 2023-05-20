class AddAdditionalFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :phone, :string, null: false
    add_column :users, :role, :integer, null: false
    add_column :users, :type, :string, null: false, default: "Patient"
    add_reference :users, :category, type: :uuid, null: true, foreign_key: true
  end
end
