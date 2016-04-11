module Mark
  enum Token
    Asterisk            # *
    CarriageReturn
    Eof
    Tab
    Space
    Newline
    Hashtag
    OpenBrace            #[
    ClosingBrace         # ]
    OpenBracket          #(
    ClosingBracket       # )
    Dash                 # -
    Backtick             # `
    Literal
  end

  struct TokenChar
    property typ
    property char
    def initialize(@typ,@char)
    end
  end

  class Scanner
    @reader: Char::Reader 
    def initialize(src : String)
      @reader=Char::Reader.new(src)
      @tokens= [] of TokenChar
    end

    def scan : Array(TokenChar)
      @reader.each do |ch|
        case ch
        when '*'
          @tokens<<TokenChar.new(Token::Asterisk,ch)
        when '\r'
          @tokens<<TokenChar.new(Token::CarriageReturn,ch)
        when '\t'
          @tokens<<TokenChar.new(Token::Tab,ch)
        when ' '
          @tokens<<TokenChar.new(Token::Space,ch)
        when '\n'
          @tokens<<TokenChar.new(Token::Newline,ch)
        when '#'
          @tokens<<TokenChar.new(Token::Hashtag,ch)
        when '['
               @tokens<<TokenChar.new(Token::OpenBrace,ch)
        when ']'
          @tokens<<TokenChar.new(Token::ClosingBrace,ch)
        when '('
               @tokens<<TokenChar.new(Token::OpenBracket,ch)
        when ')'
          @tokens<<TokenChar.new(Token::ClosingBracket,ch)
        when '-'
          @tokens<<TokenChar.new(Token::Dash,ch)
        when '`'
          @tokens<<TokenChar.new(Token::Backtick,ch)
        else
          @tokens<<TokenChar.new(Token::Literal,ch)
        end
      end
      @tokens<<TokenChar.new(Token::Eof,"")
      @tokens
    end
  end
end
