class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :image
      t.string :mail
      t.string :job
      t.date :birthday

      t.timestamps
    end
  end
end
