class AddFieldsToVote < ActiveRecord::Migration
  def change
    add_column :votes, :user_id, :integer
    add_column :votes, :battle_id, :integer
    add_column :votes, :ip, :string
  end
end
