class AddIdentifierToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :identifier, :string
  end
end
