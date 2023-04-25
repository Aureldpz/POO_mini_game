require 'pry'

class Player
  attr_accessor :name, :life_points

  def initialize(name, life_points)
    @name = name
    @life_points = life_points
  end

  def show_state
    show_state = "#{@name} a #{@life_points} de vie"
  end

  def gets_damage(damage_received)
    @life_points = @life_points.to_i - damage_received
    if @life_points <= 0 then
      puts "le joueur #{@name} a été tué !"
    end
  end

  def attacks(player)
    puts "#{@name} attaque #{player.name}"
    damage_received = compute_damage
    player.gets_damage(damage_received)
    puts "il lui inflige #{damage_received} points de dommages"

  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer

end
