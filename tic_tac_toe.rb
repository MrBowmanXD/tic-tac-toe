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
  def board
    board = [[1,2,3], [4,5,6], [7,8,9]]
    puts "| #{board[0][0]} | #{board[0][1]} | #{board[0][2]} |"
    puts '----|---|---|'
    puts "| #{board[1][0]} | #{board[1][1]} | #{board[1][2]} |"
    puts '----|---|---|'
    puts "| #{board[2][0]} | #{board[2][1]} | #{board[2][2]} |"
    puts '----|---|---|'
  end
end

class Game < GameBoard

  def initialize
    start
  end

  def start
    system('clear')
    puts 'Welcome to a new game of tic tac toe in the terminal!'
    player = Player.new
    @player = player
    board
  end
end

Game.new
