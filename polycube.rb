class Polycube
  ROADBLOCK_DEF = "D:xDim=6:yDim=6:zDim=1:oneSide\nL\n\nX\n\nI I I\n\nJ J J\n\n. L\n. L\nL L\n\n. E\n. E\nE E\n\nR\nR\nR R\n\nS\nS\nS S\n\nW W\n. W\n\nC C\n. C\n\nD D\n. D\n\nT\nT T\nT\n\n~L\nL\n. . . . . .\n. . . . . .\n. . . . . .\n. . . . . .\n. . . . . .\n. . . . . .\n~L\n\n~D\n"

  attr_accessor :output, :definition, :solutions, :number_of_solutions

  # args: quiet, info, unique, help, etc.
  # More info: http://www.mattbusche.org/blog/article/polycube/

  def initialize(options = {})
    @definition = options[:definition] || ROADBLOCK_DEF
  end

  # Run polycube command
  # Example polycube.run "--unique=1", "--info=1"
  def run(*args)
    IO.popen([PATH] + args, "w+") do |io|
      io.write(definition)
      io.close_write
      @output = io.read
    end

    true
  end

  def output_lines
    @output_lines ||= output.split("\n")
  end

  def parse_solutions
    @solutions = []
    current_solution = []
    output_lines.each do |line|
      if line.match(/# --- SOLUTION/i)
        if current_solution.any?
          @solutions << current_solution
          current_solution = []
        end
      else
        if line[0] == " " and line.size > 5 and line.size < 30
          current_solution = current_solution + line.split(" ")
        end
      end
    end

    true
  end

  def number_of_solutions
    @number_of_solutions ||= output.match(/^UNIQUE=(\d+)/)[1].to_i
  end

end
# Test: "D:xDim=6:yDim=6:zDim=1:oneSide\nL\n\nX\n\nI I I\n\nJ J J\n\n. L\n. L\nL L\n\n. E\n. E\nE E\n\nR\nR\nR R\n\nS\nS\nS S\n\nW W\n. W\n\nC C\n. C\n\nD D\n. D\n\nT\nT T\nT\n\n~L\nL\n. . . . . .\n. . . . . .\n. . . . . .\n. . . . . .\n. . . . . .\n. . . . . .\n~L\n\n~D\n"
# Test: "D:xDim=6:yDim=6:zDim=1:oneSide\nL\n\nX\n\nI I I\n\nJ J J\n\n. L\n. L\nL L\n\n. E\n. E\nE E\n\nR\nR\nR R\n\nS\nS\nS S\n\nW W\n. W\n\nC C\n. C\n\nD D\n. D\n\nT\nT T\nT\n\n~L\nL\n. . . . . .\n. . . . . .\n. . . . . .\n. . . . . .\n. . . . . .\n. . . . . .\n~L\n\n~D"
# Test: "D:xDim=10:yDim=6:zDim=1\nL:stationary=N\nN N N W W Z Z U U U\nI T N N W W Z U Y U\nI T T T X W Z Z Y Y\nI T F X X X P P Y V\nI F F F X L P P Y V\nI F L L L L P V V V\n~L\n~D"
