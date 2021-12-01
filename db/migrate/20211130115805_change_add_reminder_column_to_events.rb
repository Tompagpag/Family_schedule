class ChangeAddReminderColumnToEvents < ActiveRecord::Migration[6.1]
  def change
    rename_column :events, :add_reminder?, :add_reminder
  end
end
