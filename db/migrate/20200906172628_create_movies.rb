class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :poster_url
      t.text :description,:default => 'N/A'
      

      t.timestamps
    end
  end
end
