class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.datetime :posttime
      t.datetime :starttime
      t.datetime :endtime
      t.integer :postid
      t.integer :userid
      t.integer :category

      t.timestamps
    end
  end
end
