class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.references :requester, foreign_key: false
      t.references :receiver, foreign_key: false

      t.timestamps
    end
  end
end
