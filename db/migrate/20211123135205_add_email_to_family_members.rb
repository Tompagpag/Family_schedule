class AddEmailToFamilyMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :family_members, :email, :string
  end
end
