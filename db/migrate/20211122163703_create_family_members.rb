class CreateFamilyMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :family_members do |t|
      t.references :user, null: true, foreign_key: true
      t.references :family, null: false, foreign_key: true
      t.boolean :admin
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
