module: tickit

define interface
  #include "tickit.h",
    exclude: {
      "tickit_pen_new_attrs",
      "tickit_renderbuffer_get_cell_linemask",
      "tickit_rect_bottom",
      "tickit_rect_right",
      "tickit_stringpos_limit_bytes",
      "tickit_stringpos_limit_codepoints",
      "tickit_stringpos_limit_columns",
      "tickit_stringpos_limit_graphemes",
      "tickit_stringpos_limit_none",
      "tickit_stringpos_zero",
      "tickit_term_printf",
      "tickit_term_vprintf"
    },
    equate: {
      "char *" => <c-string>
    };

  function "tickit_pen_has_attr",
    map-result: <C-boolean>;

  function "tickit_pen_is_nonempty",
    map-result: <C-boolean>;

  function "tickit_pen_nondefault_attr",
    map-result: <C-boolean>;

  function "tickit_pen_is_nondefault",
    map-result: <C-boolean>;

  function "tickit_pen_get_bool_attr",
    map-result: <C-boolean>;

  function "tickit_pen_set_bool_attr",
    map-argument: { 3 => <C-boolean> };

  function "tickit_pen_equiv_attr",
    map-result: <C-boolean>;

  function "tickit_pen_equiv",
    map-result: <C-boolean>;

  function "tickit_rect_intersect",
    map-result: <C-boolean>,
    output-argument: 1;

  function "tickit_rect_intersects",
    map-result: <C-boolean>;

  function "tickit_rect_contains",
    map-result: <C-boolean>;

  function "tickit_rectset_intersects",
    map-result: <C-boolean>;

  function "tickit_rectset_contains",
    map-result: <C-boolean>;

  function "tickit_term_set_utf8",
    map-argument: { 2 => <C-boolean> };

  function "tickit_term_get_size",
    output-argument: 2,
    output-argument: 3;

  function "tickit_term_goto",
    map-result: <C-boolean>;

  function "tickit_term_scrollrect",
    map-result: <C-boolean>;

  function "tickit_term_getctl_int",
    map-result: <C-boolean>,
    output-argument: 3;

  function "tickit_term_setctl_int",
    map-result: <C-boolean>;

  function "tickit_term_setctl_str",
    map-result: <C-boolean>;

  function "tickit_renderbuffer_get_size",
    output-argument: 2,
    output-argument: 3;

  function "tickit_renderbuffer_has_cursorpos",
    map-result: <C-boolean>;

end interface;
