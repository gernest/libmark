module Interface
  abstract class Parser
    abstract def parse
  end

  abstract class Renderer
    abstract def next
    abstract def peek
    abstract def scan
  end

  abstract class Node
    abstract def pos
    abstract def text
  end

  abstract class Scanner
    abstract def scan
    abstract def next
  end
end
