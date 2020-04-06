class CreateAnonymousUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :anonymous_users do |t|
      t.string :display_name

      t.timestamps
    end
  end
end
