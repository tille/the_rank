class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :character_id
      t.integer :contest_id

      t.timestamps
    end
  end
end
