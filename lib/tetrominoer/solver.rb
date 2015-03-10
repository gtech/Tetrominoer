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
  class Solver
    def initialize(possibility_space, block_array, rows = nil, columns = nil, choices = nil, quick_print = nil)
      @possibility_size = possibility_space[0].length
      @number_of_possibilities = possibility_space.length
      @block_number = block_array.length
      @spaces = @possibility_size - @block_number
      #number of blocks necessary to fill the board, assumes all blocks are the same size
      @solution_size = (@possibility_size - @block_number)/block_array[0].SIZE
      @solutions = Array.new
      @possibility_space = possibility_space
      @choices = choices
      if rows and columns
        @printer = Printer.new(rows,columns)
      end
      @block_array = block_array
      @quick_print = quick_print
    end




    #PARAMS Hash<Array[Integer]>, Array[Integer]
    #Takes in a list of all possible block placements, and a list of current proposed placements
    #for a solutions. The numbers in the solution candidate are the keys of the block placements
    
    #SUMMARY Recuring function which aims to reduce the number of possible block placements
    # until there are no avaliable block placements to fill the current empty spaces, 
    # or a solution is found. The method creates a search tree.
    def solve(possibility_space, solution_candidate = Array.new)

      #Don't look for solutions with too many of our chosen blocks
      if @choices
        @choices.each_with_index do |choice, index|
          block_count = 0
          solution_candidate.each do |candidate| 
           if @possibility_space[candidate][index] == 1
             block_count += 1
           end
        if block_count > choice
          return
        end
        end
        end
      end

      #We reduced the possibility space!
      #Check if we have a solution
      #Quickly print if we want to see new solutions as the come,
      #because we're searching a massive tree
      if possibility_space.empty?
        if solution_candidate.length == @spaces/4
          @solutions.push(solution_candidate)
          if @quick_print
            output = @printer.convert_solution(solution_candidate, @possibility_space)
            @printer.print(output, @block_array)
            puts ''
            binding.pry
          end
          return @solutions
        else
          return
        end
      end
      
      #If there are no blocks(rows) in the possibility 
      #space which fit into this space(column) kill this leaf
      column = @block_number
      empty = possibility_space.select{ |k,v| v[column] == 1 }
      if empty.empty?
        return
      end

      #Find all the possiblities which fit in this space(column)
      #reduce the possiblity space, and recur
      possibility_space.each do |possibility_key, possibility|
        #If the possibility doesn't occupy this space, next
        if possibility[column] == 0
          next
        end

        #Copy current solution candidate, add the given possibility
        s_candidate = solution_candidate.dup
        s_candidate << possibility_key
        possibility_spaces = possibility[@block_number..-1]

        #Copy the possibility space for this solution candidate's subprocess
        pspace = deep_copy(possibility_space)
        #Start the reduction by deleting the latest possibility
        pspace.delete(possibility_key)

        #Find the spaces occupied by this block placement
        occupied_spaces = Array.new
        possibility_spaces.each_with_index do |space, space_index|
          if space == 1
            occupied_spaces << space_index
          end
        end
        
        #Control for the block identifier row
        occupied_spaces.map!{ |index| index + @block_number }

        #TODO Could be faster
        #Delete possibilities which overlap with the chosen block placement
        pspace.each do |p_key, p|
          flag = false
          occupied_spaces.each do |space| 
            if p[space] == 1
              flag = true
            end
          end
          if flag
            pspace.delete(p_key)
          end
        end

        #Delete the occupied spaces in every remaining row
        pspace.each do |key, row|
          delete_arr(row,occupied_spaces)
        end

        solve(pspace,s_candidate)
       end
      return @solutions
    end #end of solve method

    #Copy links and values of an object
    def deep_copy(o)
      Marshal.load(Marshal.dump(o))
    end

    #Delete an array of indices from given array
    def delete_arr(array,index_arr)
        index_arr.sort!
        shift = 0
        for i in index_arr
          array.delete_at(i-shift)
          shift += 1
        end
    end

  end #End of Solver

end #End of module
