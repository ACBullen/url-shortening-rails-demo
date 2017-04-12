class UpdateShortenedUrls < ActiveRecord::Migration[5.0]
  def change
    change_table :shortened_urls do |t|
      t.integer :user_id, null: false 
    end
  end
end
