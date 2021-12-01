class CreateReminder < ActiveRecord::Migration[6.1]
  def change
    create_table :reminders do |t|
      t.datetime :reminder_date
      t.text :reminder_comment
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
