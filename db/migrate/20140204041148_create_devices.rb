class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :mac_address
      t.string :name
      t.references :account
      t.json :settings
      t.timestamps
    end
  end
end
