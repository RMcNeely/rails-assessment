class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :bio, :text, default: "Add some details about yourself here"
    add_column :users, :status, :string, default: "Learn. Love. Code."
    add_column :users, :name, :string
  end
end
