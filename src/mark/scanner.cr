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

  class Scanner
    @reader: Char::Reader 
    def initialize(src : String)
      @reader=Char::Reader.new(src)
      @tokens=[] of Tuple
    end

    def scan : Array(Tuple)
      @reader.each do |ch|
        case ch
        when '*'
          @tokens<<{Token::Asterisk,ch}
        when '\r'
          @tokens<<{Token::CarriageReturn,ch}
        when '\0'
          @tokens<<{Token::Eof,""}
        when '\t'
          @tokens<<{Token::Tab,ch}
        when ' '
          @tokens<<{Token::Space,ch}
        when '\n'
          @tokens<<{Token::Newline,ch}
        when '#'
          @tokens<<{Token::Hashtag,ch}
        when '['
               @tokens<<{Token::OpenBrace,ch}
        when ']'
          @tokens<<{Token::ClosingBrace,ch}
        when '('
               @tokens<<{Token::OpenBracket,ch}
        when ')'
          @tokens<<{Token::ClosingBracket,ch}
        when '-'
          @tokens<<{Token::Dash,ch}
        when '`'
          @tokens<<{Token::Backtick,ch}
        else
          @tokens<<{Token::Literal,ch}
        end
      end
      @tokens
    end
  end
end
