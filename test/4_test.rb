# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/4'

class GiantSquidTest < Minitest::Test
  def setup
    @giant_squid = GiantSquid.new
    @test_data = File.read("#{File.dirname(__FILE__)}/input.txt")
  end

  def test_numbers_called_is_extracted_correctly
    assert @giant_squid.numbers_called(@test_data) == [7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1]
  end

  def test_get_boards_pulls_correct_amount_of_boards
    assert @giant_squid.get_boards(@test_data).length == 3
  end

  def test_final_board_is_correct
    assert @giant_squid
            .get_boards(@test_data)[3] = [
                                          [14,21,24,4],
                                          [10,16,15,9.19],
                                          [18,8,23,26,20],
                                          [22,11,13,6,5],
                                          [2,0,12,3,7]
                                        ]
  end  

  def test_that_bingo_score_check_tables_are_correct
    assert @giant_squid
            .get_bingo_score_check_tables(1) == [
                                                  [
                                                    [false,false,false,false,false],
                                                    [false,false,false,false,false],
                                                    [false,false,false,false,false],
                                                    [false,false,false,false,false],
                                                    [false,false,false,false,false]
                                                  ]
                                                ]
  end
end
