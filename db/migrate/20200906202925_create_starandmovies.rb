class CreateStarandmovies < ActiveRecord::Migration[6.0]
  def change
    create_table :starandmovies do |t|
      t.references :movie,foreign_key: true
      t.references :star,foreign_key: true

      t.timestamps
    end
  end
end
