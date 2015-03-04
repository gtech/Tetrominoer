#!/usr/bin/env ruby

require 'matrix'
require 'pry'
require 'tetrominoer/block'
require 'tetrominoer/possibility_generator'


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

  class Runner

    def initialize(options)
      #Take #x# and make a 2d array with those dimensions
#      size = options[0].split('x')
 #     @board = Array.new(size[0]) {Array.new(size[1],0)}
    end
    
  end
  
end
