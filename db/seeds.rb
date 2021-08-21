# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

tables = ENV["TABLES"].split(",") if ENV["TABLES"].present?

if tables.present?
  paths = tables.map { |table_name| File.join(Rails.root, "db", "seeds", "#{table_name}.csv") }
else
  paths = [File.join(Rails.root, "db", "seeds", "*.csv")]
end

Dir.glob(paths) do |path|
  table_name = File.basename(path).gsub(".csv", "")
  csv = CSV.read(path)
  header = csv.first
  data = csv[1..]
  attrs = data.map { |row| header.zip(row).to_h }

  Object.const_get(table_name.singularize.camelize).upsert_all(attrs)
end
