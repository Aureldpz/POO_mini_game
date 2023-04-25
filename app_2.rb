require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-" *49
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO'       !|"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-" *49

puts "Quel est ton nom brave guerrier ?"
print '>'
player_name = gets.chomp
player = HumanPlayer.new(player_name)


enemies = [
  Player.new("Josiane", 10, 1),
  Player.new("José", 10, 1)
]

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  # Affichage de l'état du joueur
  puts user.show_state
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts "attaquer un joueur en vue :"
  puts "0 - #{player1.show_state}"
  puts "1 - #{player2.show_state}"
  print "> "
  
  # Récupération de l'action choisie par l'utilisateur
  choice = gets.chomp
  
  case choice
  when "a"
    user.search_weapon
  when "s"
    user.search_health_pack
  when "0"
    user.attacks(player1)
  when "1"
    user.attacks(player2)
  else
    puts "Je n'ai pas compris votre choix."
  end
  
  # Riposte des ennemis
  puts "Les autres joueurs t'attaquent !"
  enemies.each do |enemy|
    if enemy.life_points > 0
      enemy.attacks(user)
    end
  end
end

# Fin de la partie
puts "La partie est finie"
if user.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end

binding.pry