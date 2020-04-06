class AddAnonymousUserToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :anonymous_user, foreign_key: true
  end
end
