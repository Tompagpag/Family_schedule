class AddContactForeignKeyToConflicts < ActiveRecord::Migration[6.1]
  def change
    add_reference :conflicts, :contact, foreign_key: true, null: true
  end
end
