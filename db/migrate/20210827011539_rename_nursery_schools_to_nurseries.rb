class RenameNurserySchoolsToNurseries < ActiveRecord::Migration[6.1]
  def change
    rename_table :nursery_schools, :nurseries
  end
end
