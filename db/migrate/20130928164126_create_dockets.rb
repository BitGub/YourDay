class CreateDockets < ActiveRecord::Migration
  def change
    create_table :dockets do |t|
      t.references :users, index: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
