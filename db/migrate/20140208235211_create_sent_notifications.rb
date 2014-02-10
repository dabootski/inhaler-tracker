class CreateSentNotifications < ActiveRecord::Migration
  def change
    create_table :sent_notifications do |t|
      t.references :notification
      t.timestamps
    end
  end
end
