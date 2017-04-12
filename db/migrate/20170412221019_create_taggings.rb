class CreateTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :taggings do |t|
      t.integer :user_id, null: false
      t.integer :tag_id, null: false
      t.integer :shortened_id, null: false
      t.timestamps
    end
    add_index :taggings, :user_id
    add_index :taggings, :tag_id
    add_index :taggings, :shortened_id
  end
end
