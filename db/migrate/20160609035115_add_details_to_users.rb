class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :bio, :text
    add_column :users, :status, :string
  end
end
