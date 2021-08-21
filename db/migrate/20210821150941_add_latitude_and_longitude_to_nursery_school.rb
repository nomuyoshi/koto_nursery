class AddLatitudeAndLongitudeToNurserySchool < ActiveRecord::Migration[6.1]
  def change
    add_column :nursery_schools, :latitude, :decimal, precision: 13, scale: 10, after: :address
    add_column :nursery_schools, :longitude, :decimal, precision: 13, scale: 10, after: :address
    add_index :nursery_schools, [:latitude, :longitude]
  end
end
