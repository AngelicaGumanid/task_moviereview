class AddShortUrlToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :short_url, :string
    add_index :movies, :short_url, unique: true
  end
end
