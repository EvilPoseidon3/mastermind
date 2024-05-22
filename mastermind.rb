module CheckAlgo

end

module ChangeAlgo
  def change_board(input)
    if input.length!= 4 && input.to_i.class != Integer
      puts "Thats not a valid answer please try again"
      self.change_board(gets.chomp)
    else 
      @change_index = game_board.first("|   |   |   |   |" )
      input.chars.each {|element| self.game_board[@change_index].sub("   ", " #{element} ")}
      puts display_board
      
  end

  def remove_change

  end
end

class Board 
 attr_accessor :game_board,:board,:row1,:row2, :column1,:column2,:column3,:column4,:column5,:column6,:column7,:column8,:column9,:column10,:column11,:column12
  def initialize
   @title ="   MASTERMIND    "
   @row1 = "-----------------"
   @row2 = "--^---^---^---^--"
   @column1 = "|   |   |   |   |"   
   @column2 = "|   |   |   |   |"   
   @column3 = "|   |   |   |   |"  
   @column4 = "|   |   |   |   |"  
   @column5 = "|   |   |   |   |"   
   @column6 = "|   |   |   |   |"   
   @column7 = "|   |   |   |   |"   
   @column8 = "|   |   |   |   |"   
   @column9 = "|   |   |   |   |"   
   @column10 = "|   |   |   |   |"   
   @column11 = "|   |   |   |   |"   
   @column12 = "|   |   |   |   |"  
   @board = [@row1, @title, @row1, @column1, @row2, @column2, @row1, @column3, @row1, @column4, @row1, @column5, @row1, @column6, @row1, @column7, @row1, @column8, @row1, @column9, @row1, @column10, @row1, @column11, @row1, @column12, @row1,]
   @game_board =[@column1, @column2,@column3, @column4,@column5, @column6,@column7, @column8,@column9, @column10,@column11, @column12]
   @display_board = @board.map { |element| "           " + element.to_s}
   puts @display_board
   puts "   Would you like to play against the "
   puts" computer or try and beat the computer?"
   puts "    (Yes) For against the computer"
   puts "       (No) To face the computer."
   @ats = gets.chomp.downcase
   if @ats == "yes"
    # run normal game
    @player = Player.new
    @computer = Computer.new
    Codechoosing.new(@player)
   elsif @ats == "no"
    # run challenge game
    @player = Player.new
    @computer = Computer.new
    Codechoosing.new(@computer)
   else
    puts "not a valid choice try again."
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
    @computer_name = (rand(1100..34343)).to_s + "Motherboard.BOT.type" + (rand(A..Z)).to_s

  end

end

class Codechoosing

  def initialize(chooser)
    if chooser.class == Player
      puts "What's your seceret code going to be?"
      puts "Choose a 4 digit number"
      @code_input = gets.chomp.to_i
      if @code_input.length == 4 && @code_input.chars.all? { |element| element.to_i == Integer}
        @encryption_code = @code_input
        puts = "Super seceret code set."
      else 
        Puts "Thats not a valid code please try again."
        Codechoosing.new(gets.chomp)
      end
    elsif chooser.class == Computer
      @encryption_code = rand.(1000...9999)
      puts "The code has been choosen be ready to fail! -#{computer_name}"
    end
  end

end

class Game < Board

  def initialize(player)
    super

  end

end

newgame = Board.new