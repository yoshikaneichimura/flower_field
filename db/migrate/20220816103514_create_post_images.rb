class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.integer :user_id, null:false
      t.integer :tag_id,  null:false
      t.string  :flower,  null:false
      t.string  :field,   null:false
      t.integer :day,     null:false
      t.string  :star,    null:false
      t.string  :address
      t.text    :comment

      t.timestamps
    end
  end
end
