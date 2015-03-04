module Tetrominoer

  class PossibiltyGenerator

    def initialize(x_size, y_size)
      @ROWS = y_size
      @COLUMNS = x_size

      #Define our posibility space with the user given x and y sizes 
      #as a multidimensional array, initialized to 0
      @possibility_space = Array.new(x_size) {Array.new(y_size){0}}
      
      #A column for every cell in the puzzle space
      @cell_space = Array.new(x_size*y_size)
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
      #TODO edge cases, and test O block(binding.pry is in place for this)
      #Find every possible row of every config for every block
      block_array.each do |block|
        #Find possible rows for every config of this block
        block.CONFIGS.each do |config|
          #The first map of the block config on the space array
          cell_space_map = Array.new(0)
          #The board index of the space array used for mapping
          space_index = 0
          #the index of the config array
          config_index = 0
          #Have we moved past the final space the space array?
#          space_array_end_flag = false
          #Map the first match of this config on the space array
          config.rows.times do #unless space_array_end_flag
            config.columns.times do #unless space_array_end_flag
              #              if config_index <= @COLUMNS
              cell_space_map[space_index] = c.config[config_index]
              config_index += 1
              space_index += 1
              #             end
            end
            space_index += @COLUMNS - space_index
          end
          #We will return this as all the possible spaces of a config
          config_possibilities = Array.new(0)
          #An index of our possibilities
          config_possibilities_index = 0
          #Our first map is a possibility
          #Our currently testing possibility, 
          possibility = cell_space_map
          until possibility.count(1) < 4
            config_possibilities[cell_possibilities_index] = possibilty
            #Shift the block forward across the space_array
            possibilty.pop
            possibilty.unshift(0)
            config_possibilities_index += 1            
          end
          binding.pry
        end
      end
    end

    def count_pieces(space_map)
      
      
    end

    
  end
end


