class CreateShortenedUrl < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.string :long_url, null: false
      t.index  :long_url, unique: true
      t.string :short_url, null: false
      t.index  :short_url, unique: true
      t.integer :user_id, null: false
    end
  end


end
