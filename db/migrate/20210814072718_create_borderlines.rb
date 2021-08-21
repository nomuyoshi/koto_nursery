class CreateBorderlines < ActiveRecord::Migration[6.1]
  def change
    create_table :borderlines do |t|
      t.integer :nursery_school_code, null: false
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

      t.datetime :created_at, null: false, default: ->{ "CURRENT_TIMESTAMP" }
      t.datetime :updated_at, null: false, default: ->{ "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }
    end

    add_foreign_key :borderlines, :nursery_schools, column: :nursery_school_code , primary_key: :code
  end
end
