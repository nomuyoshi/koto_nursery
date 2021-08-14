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
      t.string :access

      t.timestamps
    end
  end
end
