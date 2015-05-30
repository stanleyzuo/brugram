class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :avatar
      t.text :caption

      t.timestamps null: false
    end
  end
end
