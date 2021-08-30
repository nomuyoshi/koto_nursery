class RenameMaxNumberAndMinAcceptableAgeType < ActiveRecord::Migration[6.1]
  def change
    rename_column :nurseries, :min_acceptable_age_type, :min_age_type
    rename_column :capacities, :max_number, :num
  end
end
