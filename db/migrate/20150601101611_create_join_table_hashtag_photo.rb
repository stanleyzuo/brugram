class CreateJoinTableHashtagPhoto < ActiveRecord::Migration
  def change
    create_join_table :hashtags, :photos do |t|
       t.index [:hashtag_id, :photo_id]
       t.index [:photo_id, :hashtag_id]
    end
  end
end
