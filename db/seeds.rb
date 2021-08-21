# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"
file = File.join(Rails.root, "db", "seeds", "nursery_schools.csv")
csv = CSV.read(file)
header = csv.first
data = csv[1..]
attrs = data.map { |row| header.zip(row).to_h }
NurserySchool.upsert_all(attrs)
