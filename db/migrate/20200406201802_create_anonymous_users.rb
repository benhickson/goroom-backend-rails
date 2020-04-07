class CreateAnonymousUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :anonymous_users do |t|
      t.string :display_name
      t.belongs_to :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
