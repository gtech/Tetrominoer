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
    #PARAMS: possibility_space<Array<Array>>, block_number<INT>
    def initialize(possibility_space, block_array, rows = nil, columns = nil, choices = nil)
      @possibility_size = possibility_space[0].length
      @number_of_possibilities = possibility_space.length
      @block_number = block_array.length
      @spaces = @possibility_size - @block_number
      @solutions = Array.new
      @counter = 0
      @possibility_space = possibility_space
      @choices = choices
      @printer = Printer.new(rows,columns)
      @block_array = block_array
    end
    
    def solve(possibility_space, solution_candidate = Array.new)
      if possibility_space.empty? or @counter == 1
        @counter -= 1
        return @solutions
      end
      @counter -= 1
      
      possibility = possibility_space[0]
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
            puts e.backtrace
            binding.pry
        end

        column_index += 1
      end
      #If there are no doubly occupied spaces, add the block placement
        #to the solution, check to see if all spaces are filled.
      if repeat_space
        solve(possibility_space, original_solution_candidate)
      elsif solution_candidate.length == @spaces/4 #TODO magic number for block size
        @solutions.push(solution_candidate)
        @counter = 1
        return 
      else
        solve(possibility_space, solution_candidate)
        solve(possibility_space2, original_solution_candidate)
      end

      return @solutions
    end

    def solve_two(possibility_space, solution_candidate = Array.new)

      if @choices and solution_candidate.length > 0
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

      if possibility_space.empty?
        if solution_candidate.length == @spaces/4

#          puts solution_candidate
          @solutions.push(solution_candidate)
          if @choices
            output = @printer.convert_solution(solution_candidate, @possibility_space)
            @printer.print(output, @block_array)
            puts ''
          end
          return @solutions
        else
          return
        end
      end




      
      column = @block_number
      empty = possibility_space.select{ |k,v| v[column] == 1 }
      
      if empty.empty?
        return
      end
      possibility_space.each do |p_candidate_key, possibility|
        if possibility[column] == 0
          next
        end
        s_candidate = solution_candidate.dup

        s_candidate << p_candidate_key

        possibility_spaces = possibility[@block_number..-1]

        pspace = deep_copy(possibility_space)
        pspace.delete(p_candidate_key)
        #for j such that A[r,j] == 1, delete column j from matrix A
        occupied_spaces = Array.new

        possibility_spaces.each_with_index do |space, space_index|
          if space == 1
            occupied_spaces << space_index
          end
        end
        #Control for the block identifier row
        occupied_spaces.map!{ |index| index + @block_number }

        #TODO Could be faster
        #delete rows which overlap with the chosen row
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

        #delete the occupied columns in every row
        pspace.each do |key, row|
          delete_arr(row,occupied_spaces)
        end

        solve_two(pspace,s_candidate)
       end
      return @solutions
    end #end of solve two

    def deep_copy(o)
      Marshal.load(Marshal.dump(o))
    end

    def delete_arr(row,index_arr)
        index_arr.sort!
        shift = 0
        for i in index_arr
          row.delete_at(i-shift)
          shift += 1
        end
    end





  end #End of Solver

end #End of module




# n>>p
#of rows
#choose index (1)
#check every row at index to find which ones occupy that space (n)
#for each of those find all occupied spaces of that piece (p)
#Find all rows which also occupy that space and delete them (n)
#For those for spaces, delete that index from every row (n)
#
#of columns
#find all rows which have one there, (n)
#for each row find which columns are occupied by that piece (p)
#for each row which also occupy those columns, delete that index (n)
#delete those columns (4)
#
