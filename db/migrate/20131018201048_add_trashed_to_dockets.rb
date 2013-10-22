class AddTrashedToDockets < ActiveRecord::Migration
  def change
     add_column :dockets, :trashed, :boolean, :null => false, :default => false
  end
end
