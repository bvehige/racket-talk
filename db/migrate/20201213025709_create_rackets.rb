class CreateRackets < ActiveRecord::Migration[6.0]
  def change
    create_table :rackets do |t|
      t.string :model_name
      t.string :description
      t.belongs_to :brand, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
