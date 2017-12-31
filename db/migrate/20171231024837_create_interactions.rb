class CreateInteractions < ActiveRecord::Migration[5.1]
  def change
    create_table :interactions do |t|
      t.date :date
      t.string :location
      t.string :event
      t.string :description
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
