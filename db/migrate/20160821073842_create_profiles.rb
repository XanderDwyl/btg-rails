class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true
      t.string :firstname
      t.string :lastname
      t.datetime :birthdate
      t.string :address
      t.string :contactno
      t.timestamps null: false
    end
  end
end
