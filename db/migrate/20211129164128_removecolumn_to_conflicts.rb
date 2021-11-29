class RemovecolumnToConflicts < ActiveRecord::Migration[6.1]
  def change
    remove_reference :conflicts, :contact, foreign_key: true
  end
end
