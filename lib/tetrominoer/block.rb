module Tetrominoer

  #Major class for creating blocks, every block has these features.
  class Block
    @CONFIGS = Hash.new()
    @PERMUTATIONS = Integer
    attr_reader :CONFIGS, :PERMUTATIONS, :NAME

    def initialize
      @NAME = self.class.to_s.split("::")[1]
    end
  end
  


  class O < Block
    def initialize
      super
      @PERMUTATIONS = 1
      @CONFIGS = 
        [{
          rows: 2,
          columns: 2,
          config: [1,1,1,1]
         }]
    end
  end

  class L < Block
    def initialize
      super
      @PERMUTATIONS = 4
      @CONFIGS = 
        [{
          rows: 3,             #01
          columns: 2,          #01
          config: [0,1,0,1,1,1]#11
        },
         {
          rows: 2,             #100
          columns: 3,          #111
          config: [1,0,0,1,1,1]
        },
         {
          rows: 3,             #11
          columns: 2,          #10
          config: [1,1,1,0,1,0]#10
        },
         {
          rows: 2,             #111
          columns: 3,          #001
          config: [1,1,1,0,0,1]
        }
        ]
    end
  end

  class R < Block
    def initialize
      super
      @CONFIGS = 
        [{
          rows: 3,              #1 
          columns: 2,           #1
          config: [1,0,1,0,1,1] #11
         },
         {
          rows: 2,              #111
          columns: 3,           #1
          config: [1,1,1,1,0,0] 
         },
         {
          rows: 3,              #11
          columns: 2,           # 1
          config: [1,1,0,1,0,1] # 1
         },
         {
          rows: 2,              #  1
          columns: 3,           #111
          config: [0,0,1,1,1,1]
        }
        ]
    end
  end

  class I < Block
    def initialize
      super
      @CONFIGS =
        [{
          rows: 1,  
          columns: 4,
          config: [1,1,1,1] #1111
         },
         {
          rows: 4,          #1
          columns: 1,       #1
          config: [1,1,1,1] #1
         }                  #1
        ]
    end
  end

  class S < Block
    def initialize
      super
      @CONFIGS =
        [{
          rows: 2,  
          columns: 3,           # 11
          config: [0,1,1,1,1,0] #11
         },
         {
          rows: 3,              #1
          columns: 2,           #11
          config: [1,0,1,1,0,1] # 1
         }
        ]
    end
  end

  class Z < Block
    def initialize
      super
      @CONFIGS =
        [{
          rows: 2,  
          columns: 3,           #11
          config: [1,1,0,0,1,1] # 11
         },
         {
          rows: 3,              # 1
          columns: 2,           #11
          config: [0,1,1,1,1,0] #1
         }
        ]
    end
  end
end
