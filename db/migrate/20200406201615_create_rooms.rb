class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.references :creator, references: :users, null: false, foreign_key: { to_table: :users }
      t.datetime :closed_at

      t.timestamps
    end
  end
end
