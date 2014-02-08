class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :device, :null => false
      t.string :type, :null => false
      t.string :name, :null => false
      t.boolean :active, :default => false
      t.integer :timeout, :null => false
      t.json :settings
      t.timestamps
    end
  end
end
