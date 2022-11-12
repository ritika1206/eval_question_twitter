class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :tweets_count
      t.integer :followers_count
      t.integer :followings_count

      t.timestamps
    end
  end
end
