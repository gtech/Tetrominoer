class Block
    protected @configurations = Hash.new()
    attr_reader :@configurations
end

class O < Block
  def initialize
    @configurations = {1=>[[1,1],
                           [1,1]]
                      }
  end
end

class L < Block
 def initialize
    @configurations = { 1=>[[0,1],
                            [0,1],
                            [1,1]],

                       2=>[[1,0,0],
                           [1,1,1]],
                       
                       3=>[[1,1],
                           [1,0],
                           [1,0]],
                       
                       4=>[[1,1,1],
                           [0,0,1]],
                      }
  end
e
end

class R < Block
  def initialize
    @configurations = { 1=>[[1,0],
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
    @configurations = {1=> [[1,1,1,1]],
                       2=>[[1],
                           [1],
                           [1],
                           [1]],
                      }
  end
end

class S < Block
  def initialize
    @configurations = { 1=>[[0,1,1],
                            [1,1,0]],
                       
                       2=>[[1,0],
                           [1,1],
                           [0,1]],
                      }
  end
end

class Z < Block
  def initialize
    @configurations = { 1=>[[1,1,0],
                            [0,1,1]],
                       
                       2=>[[0,1],
                           [1,1],
                           [1,0]],
                      }
  end
end
