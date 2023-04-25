require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane", "10")
player2 = Player.new("José", "10")

puts "A ma droite: #{player1.name}"
puts "A ma gauche: #{player2.name}"
puts " " * 35

puts "Voici l'état de chaque joueur :" 
puts "-" * 35
puts player1.show_state
puts player2.show_state

puts " " * 35

puts "Passons à la phase d'attaque :"
puts "-" * 35

while player2.life_points.to_i > 0 && player1.life_points.to_i > 0 do
  
  player2.attacks(player1)
  puts "+" * 35
  player1.attacks(player2)
  puts "+" * 35

  puts " " * 35

  puts "Voici l'état de chaque joueur :" 
  puts "-" * 35
  puts player1.show_state
  puts player2.show_state

  puts " " * 35
  puts "+" * 35
end






