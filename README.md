# Tetrominoer

This is a simple gem for solving four block polyomino puzzles with arbitrarily sized play spaces.
I'm writing this as a fun side project to 'The Talos Principle', which I highly recommend playing.

It uses a version of algorithm X from Knuth's dancing links paper: http://arxiv.org/abs/cs/0011047 . I'm hoping the code will generalize to solve (n)-omino puzzles if you alter block.rb, but testing that isn't in the scope of this project.

The code is currently in a working state, though it lacks a reasonable interface.
Still, it is usable in its current state, here is how:

Clone this repo, and install the gem

```bash
gem install tetrominoer
```
Navigate to the bin directory and open the executable in a text editor.
There is a quick configuration section, in which you can enter the parameters of your puzzle.
Run the executable and enjoy!
