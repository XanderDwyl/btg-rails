class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :type #, default: 'user'            # admin, user
      t.timestamps null: false
    end
    add_index :users, :username, :unique => true
  end
end
