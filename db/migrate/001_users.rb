class Users < ActiveRecord::Migration

  def self.up
    create_table :users do |t|
      t.column :username, :string
      t.column :password, :string
      t.column :bio, :text
      t.column :recov_pass, :string
      t.column :email, :string
      t.column :image, :string
    end
  end

  def self.down
    drop_table :users
  end

end