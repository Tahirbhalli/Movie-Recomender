class CreateStarandusers < ActiveRecord::Migration[6.0]
  def change
    create_table :starandusers do |t|
      t.references :user, foreign_key: true
      t.references :star, foreign_key: true

      t.timestamps
    end
  end
end
