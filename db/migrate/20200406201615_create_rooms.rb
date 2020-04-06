class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.datetime :created_at
      t.references :created_by, references: :users, null: false, foreign_key: { to_table: :users }
      t.datetime :closed_at

      t.timestamps
    end
  end
end
