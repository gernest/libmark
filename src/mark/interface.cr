module Mark::Interface
  abstract class Parser
    abstract def parse
  end

  abstract class Renderer
    abstract def render
  end

  abstract class Scanner
    abstract def scan
  end
end
