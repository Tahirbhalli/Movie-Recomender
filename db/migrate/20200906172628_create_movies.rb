class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :poster_url
      t.text :description,:default => 'N/A'
      t.references :director, foreign_key: true

      t.timestamps
    end
  end
end
