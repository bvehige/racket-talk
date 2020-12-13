class ChangeRacket < ActiveRecord::Migration[6.0]
  def change
    rename_column :rackets, :model_name, :racket_name
  end
end
