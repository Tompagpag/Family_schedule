class RemoveIdentifierToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :identifier, :string
  end
end
