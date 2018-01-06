class AddColumnsToUSer < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :uid, :string
    add_column :users, :picture_url, :string
    add_column :users, :title, :string
    add_column :users, :organization, :string
    add_column :users, :summary, :string
  end
end
