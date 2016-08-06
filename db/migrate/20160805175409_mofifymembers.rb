class Mofifymembers < ActiveRecord::Migration
  def change
    add_column :members, :name, :string, null: false
    add_column :members, :gender, :integer, null: false
    add_column :members, :birthday, :date, null: false, default: false
  end
end
