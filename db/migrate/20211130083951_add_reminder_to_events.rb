class AddReminderToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :add_reminder?, :boolean
  end
end
