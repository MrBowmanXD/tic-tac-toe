# fronzen_string_literal: true
class Player
  attr_accessor :name, :name2


  def initialize
    player_name
    player_two_or_computer
  end

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
      @name2 = 'computer'
      puts 'This will be fun'
    elsif @player_two == 'p'
      player_name(@player_two)
    else
      puts 'Wrong choice'
      player_two_or_computer
    end
  end
end

class GameBoard
  def initial_board
    @board = [0,1,2,3,4,5,6,7,8]
  end

  def print_board
    puts "| #{@board[0]} | #{@board[1]} | #{@board[2]} |"
    puts '----|---|---|'
    puts "| #{@board[3]} | #{@board[4]} | #{@board[5]} |"
    puts '----|---|---|'
    puts "| #{@board[6]} | #{@board[7]} | #{@board[8]} |"
    puts '----|---|---|'
  end

  def change_board(substitute, player_position)
    if @board[substitute.to_i] == substitute.to_i && player_position == 'player_one'
      @board[substitute.to_i] = 'X'
    end

    if @board[substitute.to_i] == substitute.to_i && player_position == 'player_two'
      @board[substitute.to_i] = 'O'
    end
  end
end

class Game < GameBoard

  def initialize
    start
  end

  def select_position
    position = gets.chomp
    position
  end

  def play(nature)
    puts 'Enter the position you wish to place your mark'
    position = select_position
    if position.to_i > 8 || position.to_i < 0
      select_position
    end
    change_board(position, nature)
    print_board
  end

  def start
    system('clear')
    puts 'Welcome to a new game of tic tac toe in the terminal!'
    player = Player.new
    @player = player
    initial_board
    print_board

    play('player_one')
    play('player_two')
    play('player_one')
    play('player_two')
    play('player_one')
    check_win('X', 'player_one')
    play('player_two')
    check_win('O', 'player_two')
    play('player_one')
    check_win('X', 'player_one')
    play('player_two')
    check_win('O', 'player_two')
    play('player_one')
    check_win('X', 'player_one')
    play('player_two')
    check_win('O', 'player_two')
  end

  def check_win(mark, nature)
    if (@board[0] == mark && @board[1] == mark && @board[2] == mark) ||
      (@board[3] == mark && @board[4] == mark && @board[5] == mark) ||
      (@board[6] == mark && @board[7] == mark && @board[8] == mark) ||
      (@board[0] == mark && @board[3] == mark && @board[6] == mark) ||
      (@board[1] == mark && @board[4] == mark && @board[7] == mark) ||
      (@board[2] == mark && @board[5] == mark && @board[8] == mark) ||
      (@board[0] == mark && @board[4] == mark && @board[8] == mark) ||
      (@board[2] == mark && @board[4] == mark && @board[6] == mark)
      system('clear')
      puts "#{nature} wins, good job!"
    end
  end


end

Game.new
