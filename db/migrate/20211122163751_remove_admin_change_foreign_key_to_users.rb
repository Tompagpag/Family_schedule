class RemoveAdminChangeForeignKeyToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, :family
    remove_column :users, :admin
    remove_column :users, :first_name
    remove_column :users, :last_name

    add_reference :users, :family_member, foreign_key: true
  end
end
