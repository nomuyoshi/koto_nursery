class AddLatitudeAndLongitudeToNurserySchool < ActiveRecord::Migration[6.1]
  def change
    add_column :nursery_schools, :latitude, :decimal, after: :address
    add_column :nursery_schools, :longitude, :decimal, after: :address
    add_index :nursery_schools, [:latitude, :longitude]
  end
end
