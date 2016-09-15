class Likes < ActiveRecord::Migration

  def self.up
    create_table :likes do |t|
      t.column :post_id, :integer
      t.column :user_id, :integer
    end
  end

  def self.down
    drop_table :likes
  end
end
