class DirectorReferenceToMovies < ActiveRecord::Migration[6.0]
  def change
    add_reference :movies, :director, foreign_key: true
  end
end
