class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :ip_address

      t.timestamps
    end
  end
end
