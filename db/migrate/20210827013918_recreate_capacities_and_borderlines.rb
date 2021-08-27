class RecreateCapacitiesAndBorderlines < ActiveRecord::Migration[6.1]
  def up
    drop_table :capacities
    drop_table :borderlines

    create_table :capacities do |t|
      t.integer :nursery_code, null: false, index: true
      t.integer :age, null: false
      t.integer :max_number, null: false

      t.datetime :created_at, null: false, default: ->{ "CURRENT_TIMESTAMP" }
      t.datetime :updated_at, null: false, default: ->{ "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }
    end
    add_index :capacities, [:age, :nursery_code], unique: true
    add_foreign_key :capacities, :nurseries, column: :nursery_code , primary_key: :code

    create_table :borderlines do |t|
      t.integer :nursery_code, null: false
      t.integer :age, null: false
      t.boolean :priority_order, null: false
      t.integer :point
      t.integer :year, null: false

      t.datetime :created_at, null: false, default: ->{ "CURRENT_TIMESTAMP" }
      t.datetime :updated_at, null: false, default: ->{ "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }
    end

    add_foreign_key :borderlines, :nurseries, column: :nursery_code , primary_key: :code
  end

  def down
    drop_table :capacities
    drop_table :borderlines

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

    add_foreign_key :capacities, :nursery_schools, column: :nursery_school_code , primary_key: :code
    add_foreign_key :borderlines, :nursery_schools, column: :nursery_school_code , primary_key: :code
  end
end
