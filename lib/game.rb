class Game
  attr_accessor :turn_num

  def initialize
    @turn_num = 0
  end
  
  def self.display_welcome_message
    puts "Welcome to Tic-Tac-Toe!"
    puts ""
  end

  def start_new_turn
    self.turn_num += 1
  end
  
  def check_if_won(board, choice)
    if column_assembled?(board, choice) || row_assembled?(board, choice) || diagonal_assembled?(board, choice)
      return true
    end
    return false
  end

  def column_assembled?(board, choice)
    column = []
    if choice == 0 || choice == 3 || choice == 6
      column = [board.cells[0], board.cells[3], board.cells[6]]
    elsif choice == 1 || choice == 4 || choice == 7
      column = [board.cells[1], board.cells[4], board.cells[7]]
    else 
      column = [board.cells[2], board.cells[5], board.cells[8]]
    end

    all_equal?(column)
  end

  def row_assembled?(board, choice)
    row = []
    if choice.between?(0, 2)
      row = [board.cells[0], board.cells[1], board.cells[2]]
    elsif choice.between?(3, 5)
      row = [board.cells[3], board.cells[4], board.cells[5]]
    else 
      row = [board.cells[6], board.cells[7], board.cells[8]]
    end

    all_equal?(row)
  end

  def diagonal_assembled?(board, choice)
    diagonal1 = []
    diagonal2 = []
    if choice == 4
      diagonal1 = [board.cells[0], board.cells[4], board.cells[8]]
      diagonal2 = [board.cells[2], board.cells[4], board.cells[6]]
    elsif choice == 0 || choice == 8
      diagonal1 = [board.cells[0], board.cells[4], board.cells[8]]
    elsif  choice == 2 || choice == 6
      diagonal1 = [board.cells[2], board.cells[4], board.cells[6]]
    else
      return false
    end

    #Need to check both diagonals
    if all_equal?(diagonal1)
      if diagonal2.empty?
        return true
      else
        return all_equal?(diagonal2)
      end
    else
      return false
    end
  end

  def all_equal?(line)
    line.uniq.size <= 1
  end

  def check_if_draw
    if self.turn_num > 9
      puts "The match ended in a draw!"
      return true
    end
    return false
  end

  def prompt_player_for_choice(player, board)
    puts "#{player.name}, please enter your choice (1-9):"
    choice = nil
    loop do
      choice = gets.chomp.to_i
      if choice.between?(1, 9)
        if board.cells[choice - 1] == " "
          return choice - 1
        else
          puts "This space is already occupied, please choose another."
        end
      end
    end
  end
  
  def print_winner(symbol, p1, p2)
    if symbol == "X"
      puts "Congratulations, #{p1.name} won this round!"
    else
      puts "Congratulations, #{p2.name} won this round!"
    end
  end
      
  def self.play_again?
    puts "Do you want to play again?(Y/N)"
    loop do
      choice = gets.chomp
      if choice.upcase == "Y"
        return true
      elsif choice.upcase == "N"
        return false
      end
    end
  end

  def self.display_ending_message
    puts "Thank you for playing!"
  end

  def self.clear_screen
    puts "\e[H\e[2J"
  end

end