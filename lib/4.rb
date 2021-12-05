# frozen_string_literal: true

class GiantSquid
  def numbers_called(data)
    data.split("\n")[0].split(",")
  end
  
  def get_boards(data)
    bingo_boards = Array.new

    counter = 2
    board = Array.new
    
    while counter < data.split("\n").length - 2
      if data.split("\n")[counter] == ""
        bingo_boards << board
        board = Array.new
      else
        board << data.split("\n")[counter].split(" ")
      end
      counter += 1
    end

    bingo_boards
  end

  def check_numbers(data)
    numbers_called(data).each do |n|
      
    end
  end

end

data = File.read("#{File.dirname(__FILE__)}/input.txt")
gs = GiantSquid.new

print gs.get_boards(data)


