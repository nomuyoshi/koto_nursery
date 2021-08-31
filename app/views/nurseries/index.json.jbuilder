json.array! @nurseries do |nursery|
  json.extract! nursery, :code, :name, :address, :phone_number, :kind, :min_age_type, :opening_type, :overtime_condition_type, :url
  json.capacity nursery.capacities.inject(0) { |sum, c| sum + c.num }
end
