class CreateShortenedUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :shortened_urls do |t|
      t.text :long_url, null: false
      t.string :shortened_url, null: false, unique: true
      t.timestamps
    end

    add_index :shortened_urls, :shortened_url

  end
end
