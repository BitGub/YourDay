class AddStartAndEndTimeToDockets < ActiveRecord::Migration
  def change
    add_column :dockets, :start_datetime, :datetime
    add_column :dockets, :end_datetime, :datetime
  end
end
