class ChangeUserForeignKeyToEvents < ActiveRecord::Migration[6.1]
  def change
    remove_reference :events, :user
    add_reference :events, :family_member, foreign_key: true
  end
end
