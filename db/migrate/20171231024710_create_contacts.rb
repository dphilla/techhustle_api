class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :initial_meet
      t.string :organization
      t.string :relationship

      t.timestamps
    end
  end
end
