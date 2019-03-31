# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TOTAL_POKEMONS = 151
(1..TOTAL_POKEMONS).each do |pokemon_number|
  pokemon = Pokemon.find_or_initialize_by(id: pokemon_number)
  if !pokemon.persisted?
    url = "https://pokeapi.co/api/v2/pokemon/#{pokemon_number}"
    response = HTTParty.get(url)
    content = response.parsed_response
    pokemon.name = content['name']
    pokemon.image_url = content['sprites']['back_default']
    pokemon.save
  end
end