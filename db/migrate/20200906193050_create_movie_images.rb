class CreateMovieImages < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_images do |t|
      t.string :image_url
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
