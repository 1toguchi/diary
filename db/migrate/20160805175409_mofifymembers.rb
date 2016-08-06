class Mofifymembers < ActiveRecord::Migration
  def change
    add_column :members, :name, :string, null: false
    add_column :members, :gender, :integer
    add_column :members, :birthday, :date
  end
end
