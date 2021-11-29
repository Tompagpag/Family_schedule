class AddIdentifierToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :identifier, :string
  end
end
