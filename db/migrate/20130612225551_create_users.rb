class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :twitter_id,  :null => false
      t.string  :nickname,    :null => false
      t.string  :name,        :null => false
      t.string  :image_url,   :null => false

      t.timestamps
    end

    add_index :users, :twitter_id
  end
end
