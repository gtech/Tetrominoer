module Tetrominoer

  
  class Printer

    
    def initialize(solution,block_array, rows, columns)
      @board_matrix = Array.new(rows){Array.new(columns)}
      generate_board(solution, block_array, rows, columns)
    end


    def generate_board(solution, block_array, rows, columns)
      blocks_number = block_array.length

      solution.each_with_index do |sol_row, sol_index|
        #Find the block name for the placement
        block_identifier_array = sol_row[0..(blocks_number-1)]
        block_name = block_array[block_identifier_array.index(1)].NAME

        space_index = true
        occupied_spaces = sol_row[blocks_number..-1]
        while space_index
          if space_index = occupied_spaces.index(1)
            row = space_index/columns
            column = space_index%columns
       #     begin
              @board_matrix[row][column] = block_name
        #    rescue => e
         #   end
            occupied_spaces[space_index] = 0
          end
        end
      end
      return true
    end

    def print
      @board_matrix.each do |row|
        puts row.join
      end
    end
    
  end
end
