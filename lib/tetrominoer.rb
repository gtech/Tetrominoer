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

#!/usr/bin/env ruby

require 'pry'
require 'colorize'
require 'tetrominoer/block'
require 'tetrominoer/possibility_generator'
require 'tetrominoer/solver'
require 'tetrominoer/printer'


# Enumerate all possible position matrices for each piece type
# create aray with all 9 pieces
# Start with the first piece in its first position matrix, then add onto it the second piece first matrix. If there is a two in the solution matrix go to the next second piece matrix. 
# Once you have a successful second piece do this again with the third etc.
# If you get to the end of a piece's position matrices, start again with the next first piece's matrix
# If however you are on hte last piece's matrix and all values are correct, print the matrix for each piece.

#Take in the dimentions of the board and produce a matrix for all 
# the positions for each unique piece we are using
#
#Read matrix positions as 
#      1 2 3 4
#      5 6 7 8
#      9 A B C 
#Block class
#Has: Array of configurations, 
# 0 1 0
#Look at the board
#Take the upper right hand corner of the piece and set it into the upper right have coner of the board
#check to see if the location exists, if so enumerate through the other spots of the piece and check each one
#each time a piece of  hte block fits, write the next number into the row which you creating 
#0 or 1
#
#
#space = The smallest atomic location on a polyomino play board
#block = a tetromino
#space_array = a possible placing of a block
#possibilty space = a series of space arrays with matching block matrix
#piece = one space of a block
#configuration = an array, row and column amounts, for one orientation
#of a block

module Tetrominoer

 
    # def delete_at(o)
     #  if o.class == Array
      #   o.sort!
       #  shift = 0
        # for i in o
    #       o.delete_at(i-shift)
    #       shift += 1
    #     end
    #   else
    #     delete_at(o)
    #   end
    # end

  class Runner

    def initialize(options)
      #Take #x# and make a 2d array with those dimensions
#      size = options[0].split('x')
 #     @board = Array.new(size[0]) {Array.new(size[1],0)}
    end
    
  end
  
end
