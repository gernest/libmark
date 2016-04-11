module Mark
  enum Doc
    Break
    ATXHeading
    SelectHeading
    IndentCode
    FencedCode
    HTML
    LinkReference
    Paragraph
    Blankline
    Quote
    List
    ListItem
    Escape
    EntityReference
    CodeSpan
    Emphasis
    StrongEmphasis
    Link
    Image
    HardLineBreak
    SoftLineBreak
    Text
  end
  enum Kind 
    Block
    Inline
  end
  class Ast
    @nodes : Array(Node)
  end
  class Node
    @elem : Doc
    @kind : Kind
    @text : String
    def initialize(@elem,@kind,@text)
    end
  end
end
