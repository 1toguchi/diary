class CreateKijis < ActiveRecord::Migration
  def change
    create_table :kijis do |t|
      t.references :member, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.datetime :released_at

      t.timestamps null: false
    end
    add_index :kijis, :member_id
  end
end
