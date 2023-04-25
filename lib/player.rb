require 'pry'

class Player
  attr_accessor :name, :life_points

  def initialize(name, life_points)
    @name = name
    @life_points = life_points
  end

  def show_state
    show_state = "#{@name} a #{@life_points} de vie et une arme de niveau #{@weapon_level}"
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
    return rand(1..6) * @weapon_level
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name, life_points, weapon_level)
    @weapon_level = weapon_level # j'ai rajouté cette ligne

    super(name, life_points) #fait appel au initialize de la classe Event
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    lf_health_pack = rand(1..6)
    if lf_health_pack == 1
      puts "Tu n'as rien trouvé... "
    elsif lf_health_pack = 2..5
      life_points = life_points + 50
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else life_points = life_points + 80
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end

end
