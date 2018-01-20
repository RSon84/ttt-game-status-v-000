# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [2,5,8],
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [0,4,8]
]

def won?(board)
winner = []
empty_board = board.all? {|location| location == " "}
WIN_COMBINATIONS.each do |sub_array|
    if empty_board || full?(board)
      return false
    elsif sub_array.all? { |value| board[value] =="X" } || sub_array.all? { |value| board[value] =="O" }
      winner = sub_array
    end
  end
  winner
end
def full?(board)
  !board.any? { |location| location == " " }
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !full?(board) && !won?(board)
    return false
  elsif full?(board) && won?(board)
    return false
  else !full?(board) && won?(board)
    return false
  end
end
