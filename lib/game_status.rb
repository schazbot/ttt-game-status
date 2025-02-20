# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  # ETC, an array for each win combination
]

def won?(board)
  WIN_COMBINATIONS.find do |combo|
        board[combo[0]] == board[combo[1]] && 
        board[combo[1]] == board[combo[2]] && 
        position_taken?(board, combo[0])  
    end
end

def full?(board)
  board.all?{ |position| position == "X" || position == "O" }
end 

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || draw?(board) || won?(board)
end

def winner(board)
  winner_combo = won?(board)
  if winner_combo
    board[winner_combo[0]]
  end
end