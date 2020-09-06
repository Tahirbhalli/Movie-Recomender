class CreateGenersandmovies < ActiveRecord::Migration[6.0]
  def change
    create_table :genersandmovies do |t|
      t.references :movie, foreign_key: true
      t.references :genersofmovie,foreign_key: true
      t.timestamps
    end
  end
end
