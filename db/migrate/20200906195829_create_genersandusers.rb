class CreateGenersandusers < ActiveRecord::Migration[6.0]
  def change
    create_table :genersandusers do |t|
      t.references :user,foreign_key: true
      t.references :genersofmovie,foreign_key: true

      t.timestamps
    end
  end
end
