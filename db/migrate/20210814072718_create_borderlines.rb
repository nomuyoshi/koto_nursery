class CreateBorderlines < ActiveRecord::Migration[6.1]
  def change
    create_table :borderlines do |t|
      t.belongs_to :nursery_school, null: false, foreign_key: true
      t.integer :zero
      t.boolean :zero_priority_order
      t.integer :one
      t.boolean :one_priority_order
      t.integer :two
      t.boolean :two_priority_order
      t.integer :three
      t.boolean :three_priority_order
      t.integer :four
      t.boolean :four_priority_order
      t.integer :five
      t.boolean :five_priority_order
      t.integer :year, null: false
      t.boolean :latest, null: false

      t.timestamps
    end
  end
end
