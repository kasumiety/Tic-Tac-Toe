class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts " #{cells[0]}  | #{cells[1]}  | #{cells[2]}"
    puts "-------------"
    puts " #{cells[3]}  | #{cells[4]}  | #{cells[5]}"
    puts "-------------"
    puts " #{cells[6]}  | #{cells[7]}  | #{cells[8]}"
    puts ""
  end

  def update_board(symbol, chosen_num)
    self.cells[chosen_num] = symbol
  end
end