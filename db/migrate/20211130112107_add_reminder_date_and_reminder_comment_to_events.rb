class AddReminderDateAndReminderCommentToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :reminder_date, :datetime
    add_column :events, :reminder_comment, :text
  end
end
