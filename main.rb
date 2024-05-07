require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/player'

while true
  Game.clear_screen
  game = Game.new
  Game.display_welcome_message

  # Initializes players
  puts "Player 1, please enter your name:"
  player1 = Player.new(gets.chomp)
  puts ""
  puts "Player 2, please enter your name:"
  player2 = Player.new(gets.chomp)

  Game.clear_screen
  # Initializes board
  board = Board.new

  # Game flow loop
  while true
    game.start_new_turn

    if game.check_if_draw
      break
    end

    board.display_board
    marker = game.turn_num.odd? ? "X" : "O"

    if game.turn_num.odd?
      player_choice = game.prompt_player_for_choice(player1, board)
    else
      player_choice = game.prompt_player_for_choice(player2, board)
    end

    Game.clear_screen
    board.update_board(marker, player_choice)

    if game.check_if_won(board, player_choice)
      game.print_winner(marker, player1, player2)
      break
    end
  end
    
  #Ask the player if they want to play another match
  if Game.play_again?
    next
  else
    Game.display_ending_message
    exit 0
  end
end
