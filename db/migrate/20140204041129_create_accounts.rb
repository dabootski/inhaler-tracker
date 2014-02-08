class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :username, :null => false
      t.string :email, :null => false
      t.string :phone
      t.timestamps
    end
  end
end
