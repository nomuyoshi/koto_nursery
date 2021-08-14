class CreateCapacities < ActiveRecord::Migration[6.1]
  def change
    create_table :capacities do |t|
      t.belongs_to :nursery_school, null: false, foreign_key: true, index: { unique: true }
      t.integer :zero
      t.integer :one
      t.integer :two
      t.integer :three
      t.integer :four
      t.integer :five

      t.timestamps
    end
  end
end
