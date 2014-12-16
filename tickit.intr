module: tickit

define interface
  #include "tickit.h",
    exclude: {
      "tickit_renderbuffer_get_cell_linemask",
      "tickit_rect_bottom",
      "tickit_rect_right",
      "tickit_stringpos_limit_bytes",
      "tickit_stringpos_limit_codepoints",
      "tickit_stringpos_limit_columns",
      "tickit_stringpos_limit_graphemes",
      "tickit_stringpos_limit_none",
      "tickit_stringpos_zero"
    },
    equate: {
      "char *" => <c-string>
    };
end interface;

