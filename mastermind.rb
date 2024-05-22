module CheckAlgo
  attr_accessor :number_correct

  def check_me(game_board)
    @check_index = game_board.index('|   |   |   |   |') - 1
    @moch_column = '|   |   |   |   |'
    if @guess == @encryption_code
      self.game_won = true
      puts "Congradulation you guessed write the code was #{@encryption_code}."
      puts 'Would you like to play again?'
    else
      @number_correct = 0
      for i in 1..4
        self.number_correct = + 1 if @guess[i] == @encryption_code[i]
        @game_board[@check_index] += "#{number_correct} numbers match."
      end
    end
  end
end
 
module Codechoosing
  attr_reader :encryption_code

  protected

  def codechoosing(chooser)
    if chooser.class == Player
      puts "What's your seceret code going to be?"
      puts 'Choose a 4 digit number'
      @code_input = gets.chomp.to_i
      if (@code_input.to_s.length == 4) && (@code_input.to_s.chars.all? { |element| element.to_i.class == Integer })
        @encryption_code = @code_input
        puts = 'Super seceret code set.'
      else
        puts 'Thats not a valid code please try again.'
        codechoosing(gets.chomp)
      end
    elsif chooser.class == Computer
      @encryption_code = rand(1000...9999)
      puts "The code has been choosen be ready to fail! -#{@computer_name}"
    end
  end
end

module ChangeAlgo
  attr_reader :guess

  def change_board(input)
    @guess = input
    if input.to_s.length != 4 && input.to_i.class != Integer
      puts 'Thats not a valid answer please try again'
      change_board(gets.chomp)
    else
      @change_index = game_board.index('|   |   |   |   |')
      input.to_s.chars.each { |element| @game_board[@change_index].sub('   ', " #{element} ") }
      puts @display_board
    end
  end

  def remove_change; end
end

class Board
  include Codechoosing
  attr_accessor :game_won, :game_board, :board, :row1, :row2, :column1, :column2, :column3, :column4, :column5, :column6,
                :gamestate, :column7, :column8, :column9, :column10, :column11, :column12

  def initialize
    @game_won = false
    @title = '   MASTERMIND    '
    @row1 = '-----------------'
    @row2 = '--^---^---^---^--'
    @column1 = '|   |   |   |   |'
    @column2 = '|   |   |   |   |'
    @column3 = '|   |   |   |   |'
    @column4 = '|   |   |   |   |'
    @column5 = '|   |   |   |   |'
    @column6 = '|   |   |   |   |'
    @column7 = '|   |   |   |   |'
    @column8 = '|   |   |   |   |'
    @column9 = '|   |   |   |   |'
    @column10 = '|   |   |   |   |'
    @column11 = '|   |   |   |   |'
    @column12 = '|   |   |   |   |'
    @board = [@row1, @title, @row1, @column1, @row2, @column2, @row1, @column3, @row1, @column4, @row1, @column5, @row1,
              @column6, @row1, @column7, @row1, @column8, @row1, @column9, @row1, @column10, @row1, @column11, @row1, @column12, @row1]
    @game_board = [@column1, @column2, @column3, @column4, @column5, @column6, @column7, @column8, @column9, @column10,
                   @column11, @column12]
    @display_board = @board.map { |element| '           ' + element.to_s }
    puts @display_board
    puts '   Would you like to play against the '
    puts ' computer or try and beat the computer?'
    puts '    (Yes) For against the computer'
    puts '       (No) To face the computer.'
    @gamestate = nil
    @ats = gets.chomp.downcase
    if @ats == 'yes'
      # run normal game
      @player = Player.new
      @computer = Computer.new
      self.gamestate = true
      codechoosing(@player)
    elsif @ats == 'no'
      # run challenge game
      @player = Player.new
      @computer = Computer.new
      self.gamestate = false
      codechoosing(@computer)
    else
      puts 'not a valid choice try again.'
    end
  end
end

class Player
  def initialize
    puts "What's your name?"
    @player_name = gets.chomp.strip.downcase.capitalize
  end
end

class Computer
  def initialize
    @letterarray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    @computer_name = rand(1100..34_343).to_s + 'Motherboard.BOT.type' + @letterarray[rand(0..25)].to_s
  end
end



class Game < Board
  include ChangeAlgo
  include CheckAlgo

  def initialize
    super
    case @gamestate
    when true # runs the version where player chooses code
      while @game_won == false && @game_board.count('|   |   |   |   |') > 0
        puts 'Choose a 4 digit number'
        @computer_choice = rand(1111..9999)
        change_board(@computer_choice)
        check_me(@game_board)
      end
      if game_won == false
        puts 'You won would you like to play again?'
        puts '             (Yes/no)'
        @choice = gets.chomp
        Game.new if @choice.downcase.strip == 'yes'
      end
    when false # runs the version where computer choose code
      while @game_won == false && @game_board.count('|   |   |   |   |') > 0
        puts 'Choose a 4 digit number'
        @guess_input = gets.chomp
        change_board(@guess_input)
        check_me(@game_board)
      end
      if game_won == false
        puts 'You lost would you like to play again?'
        puts '             (Yes/no)'
        @choice = gets.chomp
        Game.new if @choice.downcase.strip == 'yes'
      end
    end
  end
end

Game.new
