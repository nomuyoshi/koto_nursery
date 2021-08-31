json.array! @borderlines_by_year.each do |year, borderlines|
  json.year year
  json.borderlines do
    json.array! borderlines, :id, :nursery_code, :age, :priority_order, :point, :less_capacity, :undisclosed
  end
end
