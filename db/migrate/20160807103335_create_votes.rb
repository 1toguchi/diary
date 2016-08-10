class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :member, null: false
      t.references :kiji, null: false


      t.timestamps null: false
    end
    add_index :votes, :kiji_id
    add_index :votes, :member_id
  end
end
