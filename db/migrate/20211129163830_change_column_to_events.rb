class ChangeColumnToEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :comment, :text
    add_column :events, :contact, :string
  end
end
