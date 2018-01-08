class CreateCurrentUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :current_users do |t|
      t.integer :current_user

      t.timestamps
    end
  end
end
