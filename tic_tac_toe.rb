# fronzen_string_literal:true
class Player
  def player_name(player = 'player one')
    puts 'What is your name?'
    if player == 'player one'
      @name = gets.chomp
    else
      @name2 = gets.chomp
    end
    system('clear')
  end

  def player_two_or_computer
    puts 'Whos is playing? computer(c) or player(p)'
    @player_two = gets.chomp
    player_nature
  end

  def player_nature
    if @player_two == 'c'
      puts "#{@name} vs. computer"
      puts 'This will be fun'
    elsif @player_two == 'p'
      player_name(player_two)
    else
      puts 'Wrong choice'
      player_two_or_computer
    end
  end

end

p1 = Player.new
p1.player_name
