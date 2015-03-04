class Block
  @CONFIGURATIONS = Hash.new()
  @ROWS = Int
  @COLUMNS = Int
  @PERMUTATIONS = Int
  attr_reader :CONFIGURATIONS, :ROWS, :COLUMNS, :PERMUTATIONS
end

class O < Block
  def initialize
    @PERMUTATIONS = 1
    @CONFIGURATIONS = 
    {1=>
     {
      rows=>2,
      columns=>2,
      config=>[1,1,1,1]
     }}

# permutations=> 1
#                        rows=> 2
#                        columns=> 2
                       

#                        1=>[[1,1],
#                            [1,1]]
#                       }
#     @CONFIGURATIONS = [1,1,1,1]
  end
end

class L < Block
 def initialize
    @PERMUTATIONS = 4
    @CONFIGURATIONS = 
      {1=>
       {
        rows=>3,
        columns=>2,
        config=>[0,1,0,1,1,1]
       }
      }
    

    # @CONFIGURATIONS = { 1=>[[0,1],
    #                         [0,1],
    #                         [1,1]],

    #                    2=>[[1,0,0],
    #                        [1,1,1]],
                       
    #                    3=>[[1,1],
    #                        [1,0],
    #                        [1,0]],
                       
    #                    4=>[[1,1,1],
    #                        [0,0,1]],
    #                   }
  end
end

class R < Block
  def initialize
    @CONFIGURATIONS = { 1=>[[1,0],
                            [1,0],
                            [1,1]],

                       2=>[[1,1,1],
                           [1,0,0]],
                       
                       3=>[[1,1],
                           [0,1],
                           [0,1]],
                       
                       4=>[[0,0,1],
                           [1,1,1]],
                      }
  end
end

class I < Block
  def initialize
    @CONFIGURATIONS = {1=> [[1,1,1,1]],
                       2=>[[1],
                           [1],
                           [1],
                           [1]],
                      }
  end
end

class S < Block
  def initialize
    @CONFIGURATIONS = { 1=>[[0,1,1],
                            [1,1,0]],
                       
                       2=>[[1,0],
                           [1,1],
                           [0,1]],
                      }
  end
end

class Z < Block
  def initialize
    @CONFIGURATIONS = { 1=>[[1,1,0],
                            [0,1,1]],
                       
                       2=>[[0,1],
                           [1,1],
                           [1,0]],
                      }
  end
end
