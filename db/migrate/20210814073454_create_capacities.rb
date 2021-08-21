class CreateCapacities < ActiveRecord::Migration[6.1]
  def change
    create_table :capacities do |t|
      t.integer :nursery_school_code, null: false
      t.integer :zero
      t.integer :one
      t.integer :two
      t.integer :three
      t.integer :four
      t.integer :five

      t.datetime :created_at, null: false, default: ->{ "CURRENT_TIMESTAMP" }
      t.datetime :updated_at, null: false, default: ->{ "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }
    end

    add_foreign_key :capacities, :nursery_schools, column: :nursery_school_code , primary_key: :code
  end
end
