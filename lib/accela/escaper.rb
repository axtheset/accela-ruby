module Accela
  module Escaper

    def escape(text)
      escapes.reduce(text) {|r, (seq, sub)|
        r.gsub(seq, sub)
      }
    end

    private

    def escapes
      {
        "."  => ".0",
        "-"  => ".1",
        "%"  => ".2",
        "/"  => ".3",
        "\\\\" => ".4",
        ":"  => ".5",
        "*"  => ".6",
        "\\"  => ".7",
        "<"  => ".8",
        ">"  => ".9",
        "|"  => ".a",
        "?"  => ".b",
        " "  => ".c",
        "&"  => ".d",
        "#"  => ".e"
      }
    end

  end
end
