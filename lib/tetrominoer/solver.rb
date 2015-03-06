module Tetrominoer
  class Solver
    #PARAMS: possibility_space<Array<Array>>, block_number<INT>
    def self.solve(possibility_space,block_number)
      solved = false
      possibility_index = 0
      possibility_size = possibility_space[0].length
      spaces = possibility_size - block_number
      solution = Array.new
      solution_index = 0
      while solved == false
        #Let's add the next possibility temporarily to the solution
        solution[solution_index] = possibility_space[possibility_index]
        #Only check the spaces, not the block identifier columns
        column_index = block_number
        repeat_space = false
        while column_index < possibility_size and not repeat_space
          #Look through every column the potential solution,
          #If there is a space occupied by two blocks, exit
          begin
            repeat = solution.select{|row| row[column_index] == 1}
          rescue => e
              binding.pry
          end

          if repeat.length > 1 
            repeat_space = true
          end
          column_index += 1
        end
        #If there are no doubly occupied spaces, add the block placement
        #to the solution, check to see if all spaces are filled.
        if not repeat_space
          solution_index += 1
          if solution_index == spaces/4
            solved = true
          end
        end
        possibility_index += 1
      end #End of solve loop

      #TODO will return bogus solutions
      if solved
        return solution
      else
        return false
      end
    end #End of solve method
  end #End of Solver
end #End of module
