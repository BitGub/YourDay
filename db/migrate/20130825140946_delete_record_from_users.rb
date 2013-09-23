class DeleteRecordFromUsers < ActiveRecord::Migration
  def change
  User.delete_all(:id => "1")
  end
end
