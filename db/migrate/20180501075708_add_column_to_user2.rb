class AddColumnToUser2 < ActiveRecord::Migration
  def change
    add_column :users, :description, :string, null: true
  end
end
