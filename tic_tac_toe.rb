class Player

  def player_name
    puts "What is your name?"
    @name = gets.chomp
    system("clear")
  end


end

p1 = Player.new
p1.player_name
