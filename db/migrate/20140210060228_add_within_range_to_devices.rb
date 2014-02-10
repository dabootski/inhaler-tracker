class AddWithinRangeToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :within_range, :boolean, :default => false
  end
end
