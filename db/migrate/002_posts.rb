class Posts < ActiveRecord::Migration

  def self.up
    create_table :posts do |t|
      t.column :content, :text
      t.column :datetime, :timestamp
      t.column :location, :string
      t.column :id_user, :integer
    end
  end

  def self.down
    drop_table :posts
  end
end
