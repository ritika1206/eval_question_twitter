class CreateUserConnection < ActiveRecord::Migration[7.0]
  def change
    create_table :user_followings do |t|
      t.references :follower, foreign_key: { to_table: :users }
      t.references :following, foreign_key: { to_table: :users }
      t.boolean :is_following_favourite, default: false

      t.timestamps
    end
  end
end
