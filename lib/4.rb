# frozen_string_literal: true

class GiantSquid
  def numbers_called(data)
    numbers_called = data.split("\n")[0].split(",")
    numbers_called.collect {|n| n.to_i}
  end
  
  def get_boards(data)
    bingo_boards = Array.new
    counter = 2
    board = Array.new

    while counter <= data.split("\n").length
      if data.split("\n")[counter] == "" || counter == data.split("\n").length
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
    numbers = numbers_called(data)

    board_counter = 0
    row_counter = 0
    column_counter = 0 
    numbers_called = []
    
    numbers.each do |number|

      numbers_called << number

      boards.each do |board|
        
        for row in 0..4
          
          if board[row].include?(number)
            column_counter = board[row].index(number)
            row_counter = row
            bingo_score_check_tables[board_counter][row_counter][column_counter] = true

            if bingo_score_check_tables[board_counter][row].all?(true)
              return (board.flatten - numbers_called).sum * number
            end

            column =  [
                        bingo_score_check_tables[board_counter][0][column_counter],
                        bingo_score_check_tables[board_counter][1][column_counter],
                        bingo_score_check_tables[board_counter][2][column_counter],
                        bingo_score_check_tables[board_counter][3][column_counter],
                        bingo_score_check_tables[board_counter][4][column_counter]
                      ]

            if column.all?(true)
              return (board.flatten - numbers_called).sum * number
            end

          end

        end

        row_counter = 0
        column_counter = 0
        board_counter += 1


      end

      board_counter = 0

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
puts gs.check_numbers(data)
