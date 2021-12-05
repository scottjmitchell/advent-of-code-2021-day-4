# frozen_string_literal: true

class GiantSquid
  def numbers_called(data)
    numbers_called = data.split("\n")[0].split(",")
    numbers_called.collect {|n| n.to_i}
  end
  
  def get_boards(data)
    bingo_boards = Array.new

    counter = 1
    board = Array.new
    
    while counter < data.split("\n").length
      if data.split("\n")[counter] == ""
        bingo_boards << board
        board = Array.new
      else
        stringy_boards = data.split("\n")[counter].split(" ")
        board << stringy_boards.collect {|n| n.to_i}
      end
      counter += 1
    end

    bingo_boards
  end

  def check_numbers(data)
    boards = get_boards(data)
    bingo_score_check_tables = get_bingo_score_check_tables(boards.length)

    numbers_called(data).each do |n|

    end
  end

  def get_bingo_score_check_tables(number_of_boards)
    boards_scores = Array.new
    
    number_of_boards.times {
      board_scores = Array.new
      5.times { board_scores << Array.new(5,false) }
      boards_scores << board_scores
    }

    boards_scores
  end

end

data = File.read("#{File.dirname(__FILE__)}/input.txt")
gs = GiantSquid.new

# gs.numbers_called(data)
# gs.get_boards(data)

print gs.get_bingo_score_check_tables(1)


