class CreateNurserySchools < ActiveRecord::Migration[6.1]
  def change
    create_table :nursery_schools, id: false do |t|
      t.integer :code,        null: false, primary_key: true
      t.string :name,         null: false
      t.string :address,      null: false
      t.string :phone_number, null: false
      t.integer :kind, null: false, default: 0
      t.integer :min_acceptable_age_type, null: false
      t.integer :opening_type, null: false
      t.integer :overtime_condition_type
      t.text :url

      t.datetime :created_at, null: false, default: ->{ "CURRENT_TIMESTAMP" }
      t.datetime :updated_at, null: false, default: ->{ "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }
    end
  end
end
