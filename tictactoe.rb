
class BoardCase  #TO DO : la classe a 2 attr_accessor, sa valeur (X, O, ou vide), ainsi que son numéro de case)

  attr_accessor :valeur_de_la_case, :numero_case
  
  def initialize (numero_case) #TO DO doit régler sa valeur, ainsi que son numéro de case
    @valeur_de_la_case = " "
    @numero_case = numero_case
  end
end


class Board    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases

  attr_accessor :board  #TO DO : la classe a 1 attr_accessor, une array qui contient les BoardCases

  def initialize    #Ces instances sont rangées dans une array qui est l'attr_accessor de la classe
    @board = [*0..8].map { |num| BoardCase.new(num).numero_case }
  end

  def to_s 
    puts "#{@board[0..2].join(" | ")}"
    puts "--|---|--"
    puts "#{@board[3..5].join(" | ")}"
    puts "--|---|--"
    puts "#{@board[6..8].join(" | ")}"
  end

  def play (symbol) #une méthode qui change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
    entry = gets.chomp().to_i
    @board = @board.each_index.map {|numero_case| entry == numero_case ? @board[numero_case] = symbol : @board[numero_case] }
  end

  def victory?
    if (@board[0] == @board[1] && @board[0] == @board[2]) || (@board[3] == @board[4] && @board[3] == @board[5]) || (@board[6] == @board[7] && @board[6] == @board[8] ) || (@board[0] == @board[3] && @board[0] == @board[6]) || (@board[1] == @board[4] && @board[1] == @board[7]) || (@board[2] == @board[5] && @board[2] == @board[8]) ||( @board[0] == @board[4] && @board[0] == @board[8]) || (@board[2] == @board[4] && @board[2] == @board[6])      
      return true
    else 
      return false
    end
  end
end


class Player #règle son nom, sa valeur, son état de victoire

  attr_accessor :first_name, :symbol

  def initialize (symbol)
    puts "Welcome to the wonderful world of Tic TAC tOE"
    puts "What's your name dear new player?"
    @first_name = gets.chomp
    puts "Nice to meet you ! You will play with the #{symbol} symbol!! "
    puts
    @symbol = symbol
  end
end

class Game

  def initialize 
    @board = Board.new
    @player1 = Player.new("X")
    @player2 = Player.new("O")
  end

  def go 
    while @board.victory? == false
      self.turn
    end
  end

  def turn 
    ObjectSpace.each_object(Player) do |obj|
    @board.to_s
    puts 
    puts "It's your turn #{obj.first_name}, pick a number on the grid that is not already taken !!"
    @board.play(obj.symbol) 
      if @board.victory? == true 
        @board.to_s
        puts ""
        puts "Wow ! Congrats #{obj.first_name} , you won motherfucker !!!"
      break
    end
  end
end
end

Game.new.go


