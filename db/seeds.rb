# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Type.create(name: "Silo")
Type.create(name: "Bolo")
Type.create(name: "Fardo")

Composition.create(name: "Alfalfa")
Composition.create(name: "Ballica")
Composition.create(name: "Paja")
Composition.create(name: "trebol")

comunas = [
  "Puerto Montt",
  "Puerto Varas",
  "Calbuco",
  "Maullín",
  "Cochamó",
  "Los Muermos",
  "Frutillar",
  "Llanquihue",
  "Puerto Octay",
  "Fresia",
  "Purranque",
  "Puyehue",
  "Río Negro",
  "Osorno",
  "San Juan de la Costa",
  "San Pablo",
  "Chaitén",
  "Futaleufú",
  "Hualaihué",
  "Palena",
  "Castro",
  "Chonchi",
  "Curaco de Vélez",
  "Dalcahue",
  "Puqueldón",
  "Queilén",
  "Quellón",
  "Quemchi",
  "Quinchao",
  "Ancud",
  "Chaitén",
  "Futaleufú",
  "Hualaihué",
  "Palena"
]

comunas.each do |comunas|
    Locality.create(name: comunas)
end

User.create(email: "admin@gmail.com", password: "123456")