class CreateStreamVotes < ActiveRecord::Migration
  def change
    create_table :stream_votes do |t|

      t.integer :stream_id
      t.integer :user_id
      t.integer :like , :default => 0

      t.timestamps
    end
  end
end
