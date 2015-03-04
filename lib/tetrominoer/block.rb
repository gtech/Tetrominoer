module Tetrominoer

  #Major class for creating blocks, every block has these features.
  class Block
    @CONFIGS = Hash.new()
    @PERMUTATIONS = Integer
    attr_reader :CONFIGS, :PERMUTATIONS
  end


  #2 by 2 block
  class O < Block
    def initialize
      @PERMUTATIONS = 1
      @CONFIGS = 
        {1=>
        {
          rows: 2,
          columns: 2,
          config: [1,1,1,1]
        }}

      # permutations=> 1
      #                        rows=> 2
      #                        columns=> 2
      

      #                        1=>[[1,1],
      #                            [1,1]]
      #                       }
      #     @CONFIGS = [1,1,1,1]
    end
  end

  class L < Block
    def initialize
      @PERMUTATIONS = 4
      @CONFIGS = 
        {1=>
        {
          rows: 3,
          columns: 2,
          config: [0,1,0,1,1,1]
        }
      }
      

      # @CONFIGS = { 1=>[[0,1],
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
      @CONFIGS = { 1=>[[1,0],
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
      @CONFIGS = {1=> [[1,1,1,1]],
        2=>[[1],
            [1],
            [1],
            [1]],
      }
    end
  end

  class S < Block
    def initialize
      @CONFIGS = { 1=>[[0,1,1],
                              [1,1,0]],
        
        2=>[[1,0],
            [1,1],
            [0,1]],
      }
    end
  end

  class Z < Block
    def initialize
      @CONFIGS = { 1=>[[1,1,0],
                              [0,1,1]],
        
        2=>[[0,1],
            [1,1],
            [1,0]],
      }
    end
  end
end
