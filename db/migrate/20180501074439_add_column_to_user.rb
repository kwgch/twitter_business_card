class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :screen_name, :string, null: true
  end
end
