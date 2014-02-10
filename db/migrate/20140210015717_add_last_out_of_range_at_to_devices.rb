class AddLastOutOfRangeAtToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :last_out_of_range, :datetime, :null => true
  end
end
