class CreateConflicts < ActiveRecord::Migration[6.1]
  def change
    create_table :conflicts do |t|
      t.string :conflict_type
      t.date :date
      t.references :family, null: false, foreign_key: true

      t.timestamps
    end
  end
end
