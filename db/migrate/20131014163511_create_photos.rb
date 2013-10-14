class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.date :date
      t.string :image
      t.integer :timeline_id
      t.integer :user_id

      t.timestamps
    end
  end
end
