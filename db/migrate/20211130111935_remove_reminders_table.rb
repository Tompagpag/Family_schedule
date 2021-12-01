class RemoveRemindersTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :reminders
  end
end
