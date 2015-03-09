# Tetrominoer, solve small polyomino puzzles
#     Copyright (C) 2015 William H Duncan III

#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.

#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.

#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.

module Tetrominoer

  class PossibilityGenerator
    @possibility_space = Array.new
    attr_reader :possibility_space

    def initialize(rows, columns)
      @ROWS = rows
      @COLUMNS = columns

      #Define our posibility space with the user given x and y sizes 
      #as a multidimensional array, initialized to 0
      @possibility_space = Array.new#(@ROWS) {Array.new(@COLUMNS){0}}
      
      #A column for every cell in the puzzle space
      @cell_space = Array.new(@ROWS*@COLUMNS,0)
    end

    #INPUT array of the blocks to be used
    #SUMMARY
    #Take a config and map it onto the space array, then treat
    #the space array like a queue, pop spaces off the back
    #and add blank spaces to the front.
    #
    #Each map that has all four pieces of the block is a posibility.
    #When the space array has only 3 pieces, discard that map and 
    #continue onto the next configuration.
    #
    #When all blocks are exhausted, return the possibilty rows with the
    #block matrix attached
    def generate(block_array)
      #TODO edge cases, O still has one extra possibility on 3x3, figure out how to isolate it and try
      #to generalize

      #Find every possible row of every config for every block

      block_array.each_with_index do |block, block_index|
        block_possibilities = Array.new
        #Find possible rows for every config of this block
        block.CONFIGS.each do |config|
          #The config cannot fit if it's too big for the board
          if config[:rows] > @ROWS or config[:columns] > @COLUMNS
            next
          end
          #The first map of the block config on the space array
          cell_space_map = @cell_space.dup
          #The board index of the space array used for mapping
          space_index = 0
          #the index of the config array
          config_index = 0
          #Map the first match of this config on the space array
          config[:rows].times do #unless space_array_end_flag
            config[:columns].times do #unless space_array_end_flag
              cell_space_map[space_index] = config[:config][config_index]
              config_index += 1
              space_index += 1
              if space_index % @COLUMNS 
              end
            end
            #Move to the next row of the cell_space_map if we are going to the next row of the config
            if space_index % @COLUMNS > 0
              space_index += @COLUMNS - (space_index % @COLUMNS)
            end
          end
          #We will return this as all the possible spaces of a config
          config_possibilities = Array.new(0,0)
          #An index of our possibilities
          config_possibilities_index = 0
          #The index of the first piece of the config
          index_of_first_piece = 0
          #Our first map is a possibility
          #Our currently testing possibility, 
          possibility = cell_space_map
          #When a piece of the block has fallen off the end of the board, throw it away and terminate the loop.
          until possibility.count(1) < 4 #TODO magic number
            config_possibilities[config_possibilities_index] = possibility.dup
            #Shift the block forward across the space_array
            possibility.pop
            possibility.unshift(0)
            index_of_first_piece += 1

            #Check to see if the block is split across the right boarder of the space_map
            #Wastefull of 2-3 loops because we'll pop the number of columns off 
            #when we hit the end of the cell_space_map
            column_number = 1
            while column_number < config[:columns]
              if (index_of_first_piece + config[:columns]) % @COLUMNS == column_number
                possibility.pop
                possibility.unshift(0)
                index_of_first_piece += 1
              end
              column_number +=1
            end

            config_possibilities_index += 1            
          end
          #Add the generated possibilties of this config to the total possibilities for the block
          block_possibilities += config_possibilities
        end #End of config possibilties loop
        #TODO append block identifier to possibility row
        block_identifier_array = Array.new(block_array.length,0)
        block_identifier_array[block_index] = 1
        block_possibilities.collect!{ |config_possibility| 
          block_identifier_array + config_possibility}
        @possibility_space += block_possibilities
      end #End of block possibilities loop
      return true
    end

    def generate_two(block_array)
      generate(block_array)
      possibility_hash = Hash.new
      for possibility_index in 0..(@possibility_space.length-1)
        possibility_hash[possibility_index] = possibility_space[possibility_index]
      end
      @possibility_space = possibility_hash
      return true
    end

    def refine_choices(block_array, choices)
      
      
    end


  end
end


