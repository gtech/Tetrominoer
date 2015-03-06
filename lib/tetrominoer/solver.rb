module Tetrominoer
  class Solver
    #PARAMS: possibility_space<Array<Array>>, block_number<INT>
    def initialize(possibility_space,block_number)
      @possibility_size = possibility_space[0].length
      @number_of_possibilities = possibility_space.length
      @block_number = block_number
      @spaces = @possibility_size - @block_number
    end
    
    def solve(possibility_space, solution_candidate = Array.new, solutions = Array.new)
      if possibility_space.empty?
#        binding.pry
        return false
      end
    
      possibility = possibility_space[0].dup
      possibility_space.delete_at(0)
      possibility_space2 = possibility_space.dup
    
      original_solution_candidate = solution_candidate.dup
      solution_candidate.push(possibility)
      repeat_space = false
      column_index = @block_number
      while column_index < @possibility_size and not repeat_space
      begin
        repeat = solution_candidate.select{|row| row[column_index] == 1}
  
        if repeat.length > 1 
          repeat_space = true
        end
          rescue => e
          binding.pry
        end

        column_index += 1
      end
      #If there are no doubly occupied spaces, add the block placement
        #to the solution, check to see if all spaces are filled.
      if repeat_space
        if sol1 =  solve(possibility_space, original_solution_candidate, solutions) and  not sol1.empty?
#          solutions.push(sol1)
          solutions += sol1
          binding.pry
        end
      elsif solution_candidate.length == @spaces/4 #TODO magic number for block size
#       binding.pry
        return solutions.push(solution_candidate)
 #       return solutions += solution_candidate
      else
        if sol1 = solve(possibility_space, solution_candidate, solutions) and  not sol1.empty?
#          solutions.push(sol1)
          solutions += sol1
        end
        if sol2 = solve(possibility_space2, original_solution_candidate, solutions) and not sol2.empty?
          solutions += sol2
#          solutions.push(sol2)
        end
      end
        
      return solutions
    end
  end #End of Solver
end #End of module
