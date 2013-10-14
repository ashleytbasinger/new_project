class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
