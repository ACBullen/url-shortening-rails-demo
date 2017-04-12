class CreateTagTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_topics do |t|
      t.string :tag, null: false, unique: true
      t.timestamps
    end
    add_index :tag_topics, :tag
  end
end
