module CheckAlgo

end

module ChangeAlgo

end

class Game < Board

  def initialize(player)
    super
  end

end

class Board 
 attr_accessor :board,:row1,:row2, :column1,:column2,:column3,:column4,:column5,:column6,:column7,:column8,:column9,:column10,:column11,:column12
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
   @display_board = @board.map { |element| "           " + element.to_s}
   puts @display_board
   puts "   Would you like to play against the "
   puts" computer or try and beat the computer?"
   puts "(Yes) For against the computer"
   puts "(No) To face the computer."
   @ats = gets.chomp.downcase
   if @ats == "yes"
    # run normal game
   elsif
    # run challenge game
   else
    puts "not a valid choice try again."
end 

end

class Player

  def initialize
  
  end 

end

class Computer

  def initialize

  end

end

newgame = Board.new