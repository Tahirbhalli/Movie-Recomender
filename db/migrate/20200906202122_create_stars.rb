class CreateStars < ActiveRecord::Migration[6.0]
  def change
    create_table :stars do |t|
      t.string :name
      t.string :pic_url
      t.text :description

      t.timestamps
    end
  end
end
