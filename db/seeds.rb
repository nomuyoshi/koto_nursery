# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

models = ENV["MODELS"].split(",") if ENV["MODELS"].present?

if models.present?
  paths = models.map { |name| File.join(Rails.root, "db", "seeds", "#{name}.csv") }
else
  paths = [File.join(Rails.root, "db", "seeds", "*.csv")]
end

Dir.glob(paths) do |path|
  model_name = File.basename(path).gsub(".csv", "")
  csv = CSV.read(path)
  header = csv.first
  data = csv[1..]
  attrs = data.map { |row| header.zip(row).to_h }

  Object.const_get(model_name.camelize).upsert_all(attrs)
end
