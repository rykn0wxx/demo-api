class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.boolean :admin, default: false
      t.string :email, limit: 100, null: false, default: ''
      t.string :username, limit: 50, null: false, default: ''
      t.string :password_digest, null: false, default: ''

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
  end
end
