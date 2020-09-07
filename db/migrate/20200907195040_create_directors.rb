class CreateDirectors < ActiveRecord::Migration[6.0]
  def change
    create_table :directors do |t|
      t.string :name,null: false
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
