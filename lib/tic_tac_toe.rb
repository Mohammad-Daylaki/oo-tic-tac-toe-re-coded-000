class TicTacToe
  def initialize(board =nil)
    @board =Array.new(9, " ")
  end
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def move(position, player)
    @board[position.to_i- 1]= player
  end
  def position_taken?(index)
    if @board[index]== " " || @board[index]== "" || @board[index]==nil
      return false
    elsif @board[index]=="X" || @board[index]=="O"
      return true
    end
  end
  def valid_move?(position)
    if  ((position.to_i.between?(1,9)) && !(position_taken?(position.to_i - 1)))
      return true
    else
      return false
    end
  end
  def turn
    puts "Please enter 1-9:"
    position=gets.strip
    m2 =position.to_i
    n =current_player
    if valid_move?(position)
      move(m2,n)
      display_board
    else
      turn
    end
  end
  def turn_count
    count =0
    @board.each do |item|
      if item == "X" || item == "O"
        count +=1
      end
    end
    return count
  end
  def current_player
    if turn_count%2 ==0
      return "X"
    else
      return "O"
    end
  end
  def won?
    WIN_COMBINATIONS.detect do |i|
      @board[i[0]] == @board[i[1]] && @board[i[1]] == @board[i[2]] && position_taken?(i[0])
    end
  end
  def full?
    result = true
  @board.each do |i|
    if i != "X" && i != "O"
      result = false
    end
  end
  result
  end
  def draw?
  !won? && full?
  end
  def over?
  draw? || won?
  end
  def winner
  i =won?
  if i
    return @board[i[0]]
  end
  end
  def play
    while !over?
      turn
    end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cats Game!"
      end
  end
end
