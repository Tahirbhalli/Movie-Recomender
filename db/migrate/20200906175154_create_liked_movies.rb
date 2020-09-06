class CreateLikedMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :liked_movies do |t|
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
