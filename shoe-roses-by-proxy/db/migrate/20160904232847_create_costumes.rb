class CreateCostumes < ActiveRecord::Migration[5.0]

  def change
    create_table :costumes do |t|
      t.string :name
      t.integer :number_of_pieces
      t.integer :theater_id
      t.integer :period_id
      t.timestamps
    end
  end
end
