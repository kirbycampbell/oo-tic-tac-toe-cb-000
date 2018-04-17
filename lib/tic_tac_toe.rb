class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
 index = user_input.to_i
 index -= 1
end

def move(index, token)
  @board[index] = token
  turn_count
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end


def turn
  puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
          if valid_move?(index)
            move(index, current_player)
          else
            turn
          end
      display_board
end


def turn_count
  counter = 0
  @board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  counter
end

def current_player
  if turn_count % 2 == 0
    "X"
  else
    "O"
  end
end
##-----

def won?
WIN_COMBINATIONS.find do |spot|
  @board[spot[0]] == @board[spot[1]] && @board[spot[0]] == @board[spot[2]] && position_taken?(spot[0])
  end
end

def full?
  board.none? do |i|
  i == " "
  end
end

def draw?
  won? == nil && full? == true
end

def over?
  won? != nil || full? == true || draw? == true
end

def winner
  if won? != nil
    winner = @board[won?[0]]

  end
end


def play
  puts "Welcome to Tic Tac Toe!"
      until over? == true
      turn
      end
        if draw? == true
          puts "Cat\'s Game!"
        elsif won?
          puts "Congratulations #{winner}!"
        end
  end




end
