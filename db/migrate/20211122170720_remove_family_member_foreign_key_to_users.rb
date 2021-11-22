class RemoveFamilyMemberForeignKeyToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, :family_member
  end
end
