class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.datetime :created_at
      t.references :created_by, null: false, foreign_key: true
      t.datetime :closed_at

      t.timestamps
    end
  end
end
