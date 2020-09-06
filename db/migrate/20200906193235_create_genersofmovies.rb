class CreateGenersofmovies < ActiveRecord::Migration[6.0]
  def change
    create_table :genersofmovies do |t|
      t.string :name

      t.timestamps
    end
  end
end
