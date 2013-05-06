class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer :contester1
      t.integer :contester2
      t.integer :votes_contester1, :default => 0
      t.integer :votes_contester2, :default => 0
      t.integer :total_votes, :default => 0
      t.timestamps
    end
    
    add_index :battles, [:contester1, :contester2]
  end
end
