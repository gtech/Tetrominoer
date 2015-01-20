#!/usr/bin/env ruby

require 'matrix'
require 'pry'

# Enumerate all possible position matrices for each piece type
# create aray with all 9 pieces
# Start with the first piece in its first position matrix, then add onto it the second piece first matrix. If there is a two in the solution matrix go to the next second piece matrix. 
# Once you have a successful second piece do this again with the third etc.
# If you get to the end of a piece's position matrices, start again with the next first piece's matrix
# If however you are on hte last piece's matrix and all values are correct, print the matrix for each piece.

module Tetrominoer

  class Matrix
    def sum
      sum = 0
      self.each {|i| sum +=i}
      return sum
    end
  end  


  class PieceMatrixGenerator

    def initialize(size)
      rows = Array.new(size, 0)
      total = Array.new(size,rows)


      #    @null_matrix =  Matrix.rows(total)
      #TODO This is kludgey
      @null_matrix = Matrix.build(size)
      @matricies = Array.new

      #Decrement size because I'm lazy for array indexing
      size -= 1

      #    @positions = Array [[0,0],[0,1],[0,2],[1,2]]
      @one = Array.new [0,0]

      #   @matrix[0][1] = 1
      @two = Array.new [0,1]

      #  @matrix[0][2] = 1
      @three = Array.new [0,2]

      # @matrix[1][2] = 1
      @four = Array.new [1,2]

      @squares = Array.new [@one,@two,@three,@four]
    end  

    def shift_down
      if @one[1] + 1 < size and @two[1] + 1 < size and @three[1] + 1 < size and @four[1] + 1 < size
        @one[1] += 1
        @two[1] += 1
        @three[1]+= 1
        @four[1] += 1
        return true
      else
        return false
      end
    end

    def shift_right
      if @one[0] + 1 < size and @two[0] + 1 < size and @three[0] + 1 < size and @four[0] + 1 < size
        @one[0] += 1
        @two[0] += 1
        @three[0]+= 1
        @four[0] += 1
        return true
      else
        return false
      end
    end


    def generate
      generated = false
      
      matricies = Array.new

      i = 0

      matricies[i] = @null_matrix.clone
      binding.pry
      matricies[i][@one[0][@one[1]]] = 1
      matricies[i][@two[0][@two[1]]] = 1
      matricies[i][@three[0][@three[1]]] = 1
      matricies[i][@four[0][@four[1]]] = 1
      

      i+=1
      until generated
        
        matricies[i] = @null_matrix.clone
        
        if shift_right
          matricies[i][@one[0][@one[1]]] = 1
          matricies[i][@two[0][@two[1]]] = 1
          matricies[i][@three[0][@three[1]]] = 1
          matricies[i][@four[0][@four[1]]] = 1
        elsif shift_down
          matricies[i][@one[0][@one[1]]] = 1
          matricies[i][@two[0][@two[1]]] = 1
          matricies[i][@three[0][@three[1]]] = 1
          matricies[i][@four[0][@four[1]]] = 1
        else 
          generated = true
        end

        i += 1
      end
      return matricies
    end
  end


  
end
