module: tickit

define constant <TickitEventType> = <C-int>;
define constant $TICKIT-EV-RESIZE = 1;
define constant $TICKIT-EV-KEY = 2;
define constant $TICKIT-EV-MOUSE = 4;
define constant $TICKIT-EV-CHANGE = 8;
define constant $TICKIT-EV-GEOMCHANGE = 16;
define constant $TICKIT-EV-EXPOSE = 32;
define constant $TICKIT-EV-FOCUS = 64;
define constant $TICKIT-EV-UNBIND = 0;

define constant <TickitMaybeBool> = <C-int>;
define constant $TICKIT-NO = 0;
define constant $TICKIT-YES = 1;
define constant $TICKIT-MAYBE = -1;

define C-struct <TickitPen>
end;

define constant <TickitPenAttr> = <C-int>;
define constant $TICKIT-PEN-FG = 0;
define constant $TICKIT-PEN-BG = 1;
define constant $TICKIT-PEN-BOLD = 2;
define constant $TICKIT-PEN-UNDER = 3;
define constant $TICKIT-PEN-ITALIC = 4;
define constant $TICKIT-PEN-REVERSE = 5;
define constant $TICKIT-PEN-STRIKE = 6;
define constant $TICKIT-PEN-ALTFONT = 7;
define constant $TICKIT-PEN-BLINK = 8;
define constant $TICKIT-N-PEN-ATTRS = 9;

define constant <TickitPenAttrType> = <C-int>;
define constant $TICKIT-PENTYPE-BOOL = 0;
define constant $TICKIT-PENTYPE-INT = 1;
define constant $TICKIT-PENTYPE-COLOUR = 2;

define C-pointer-type <TickitPen*> => <TickitPen>;
define C-function tickit-pen-new
  result res :: <TickitPen*>;
  c-name: "tickit_pen_new";
end;

define C-function tickit-pen-clone
  input parameter orig_ :: <TickitPen*>;
  result res :: <TickitPen*>;
  c-name: "tickit_pen_clone";
end;

define C-function tickit-pen-destroy
  input parameter pen_ :: <TickitPen*>;
  c-name: "tickit_pen_destroy";
end;

define C-function tickit-pen-ref
  input parameter pen_ :: <TickitPen*>;
  result res :: <TickitPen*>;
  c-name: "tickit_pen_ref";
end;

define C-function tickit-pen-unref
  input parameter pen_ :: <TickitPen*>;
  c-name: "tickit_pen_unref";
end;

define C-function tickit-pen-has-attr
  input parameter pen_ :: <TickitPen*>;
  input parameter attr_ :: <TickitPenAttr>;
  result res :: <C-boolean>;
  c-name: "tickit_pen_has_attr";
end;

define C-function tickit-pen-is-nonempty
  input parameter pen_ :: <TickitPen*>;
  result res :: <C-boolean>;
  c-name: "tickit_pen_is_nonempty";
end;

define C-function tickit-pen-nondefault-attr
  input parameter pen_ :: <TickitPen*>;
  input parameter attr_ :: <TickitPenAttr>;
  result res :: <C-boolean>;
  c-name: "tickit_pen_nondefault_attr";
end;

define C-function tickit-pen-is-nondefault
  input parameter pen_ :: <TickitPen*>;
  result res :: <C-boolean>;
  c-name: "tickit_pen_is_nondefault";
end;

define C-function tickit-pen-get-bool-attr
  input parameter pen_ :: <TickitPen*>;
  input parameter attr_ :: <TickitPenAttr>;
  result res :: <C-boolean>;
  c-name: "tickit_pen_get_bool_attr";
end;

define C-function tickit-pen-set-bool-attr
  input parameter pen_ :: <TickitPen*>;
  input parameter attr_ :: <TickitPenAttr>;
  input parameter val_ :: <C-boolean>;
  c-name: "tickit_pen_set_bool_attr";
end;

define C-function tickit-pen-get-int-attr
  input parameter pen_ :: <TickitPen*>;
  input parameter attr_ :: <TickitPenAttr>;
  result res :: <C-signed-int>;
  c-name: "tickit_pen_get_int_attr";
end;

define C-function tickit-pen-set-int-attr
  input parameter pen_ :: <TickitPen*>;
  input parameter attr_ :: <TickitPenAttr>;
  input parameter val_ :: <C-signed-int>;
  c-name: "tickit_pen_set_int_attr";
end;

define C-function tickit-pen-get-colour-attr
  input parameter pen_ :: <TickitPen*>;
  input parameter attr_ :: <TickitPenAttr>;
  result res :: <C-signed-int>;
  c-name: "tickit_pen_get_colour_attr";
end;

define C-function tickit-pen-set-colour-attr
  input parameter pen_ :: <TickitPen*>;
  input parameter attr_ :: <TickitPenAttr>;
  input parameter value_ :: <C-signed-int>;
  c-name: "tickit_pen_set_colour_attr";
end;

define C-function tickit-pen-set-colour-attr-desc
  input parameter pen_ :: <TickitPen*>;
  input parameter attr_ :: <TickitPenAttr>;
  input parameter value_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "tickit_pen_set_colour_attr_desc";
end;

define C-function tickit-pen-clear-attr
  input parameter pen_ :: <TickitPen*>;
  input parameter attr_ :: <TickitPenAttr>;
  c-name: "tickit_pen_clear_attr";
end;

define C-function tickit-pen-clear
  input parameter pen_ :: <TickitPen*>;
  c-name: "tickit_pen_clear";
end;

define C-function tickit-pen-equiv-attr
  input parameter a_ :: <TickitPen*>;
  input parameter b_ :: <TickitPen*>;
  input parameter attr_ :: <TickitPenAttr>;
  result res :: <C-boolean>;
  c-name: "tickit_pen_equiv_attr";
end;

define C-function tickit-pen-equiv
  input parameter a_ :: <TickitPen*>;
  input parameter b_ :: <TickitPen*>;
  result res :: <C-boolean>;
  c-name: "tickit_pen_equiv";
end;

define C-function tickit-pen-copy-attr
  input parameter dst_ :: <TickitPen*>;
  input parameter src_ :: <TickitPen*>;
  input parameter attr_ :: <TickitPenAttr>;
  c-name: "tickit_pen_copy_attr";
end;

define C-function tickit-pen-copy
  input parameter dst_ :: <TickitPen*>;
  input parameter src_ :: <TickitPen*>;
  input parameter overwrite_ :: <C-boolean>;
  c-name: "tickit_pen_copy";
end;

define constant <TickitPenEventFn> = <C-function-pointer>;
define C-pointer-type <TickitPenEventFn*> => <TickitPenEventFn>;
define C-function tickit-pen-bind-event
  input parameter tt_ :: <TickitPen*>;
  input parameter ev_ :: <TickitEventType>;
  input parameter fn_ :: <TickitPenEventFn*>;
  input parameter user_ :: <C-void*>;
  result res :: <C-signed-int>;
  c-name: "tickit_pen_bind_event";
end;

define C-function tickit-pen-unbind-event-id
  input parameter tt_ :: <TickitPen*>;
  input parameter id_ :: <C-signed-int>;
  c-name: "tickit_pen_unbind_event_id";
end;

define C-function tickit-pen-attrtype
  input parameter attr_ :: <TickitPenAttr>;
  result res :: <TickitPenAttrType>;
  c-name: "tickit_pen_attrtype";
end;

define C-function tickit-pen-attrname
  input parameter attr_ :: <TickitPenAttr>;
  result res :: <C-string>;
  c-name: "tickit_pen_attrname";
end;

define C-function tickit-pen-lookup-attr
  input parameter name_ :: <C-string>;
  result res :: <TickitPenAttr>;
  c-name: "tickit_pen_lookup_attr";
end;

define C-struct <TickitRect>
  sealed slot TickitRect$top :: <C-signed-int>;
  sealed slot TickitRect$left :: <C-signed-int>;
  sealed slot TickitRect$lines :: <C-signed-int>;
  sealed slot TickitRect$cols :: <C-signed-int>;
end;

define C-pointer-type <TickitRect*> => <TickitRect>;
define C-function tickit-rect-init-sized
  input parameter rect_ :: <TickitRect*>;
  input parameter top_ :: <C-signed-int>;
  input parameter left_ :: <C-signed-int>;
  input parameter lines_ :: <C-signed-int>;
  input parameter cols_ :: <C-signed-int>;
  c-name: "tickit_rect_init_sized";
end;

define C-function tickit-rect-init-bounded
  input parameter rect_ :: <TickitRect*>;
  input parameter top_ :: <C-signed-int>;
  input parameter left_ :: <C-signed-int>;
  input parameter bottom_ :: <C-signed-int>;
  input parameter right_ :: <C-signed-int>;
  c-name: "tickit_rect_init_bounded";
end;

define C-function tickit-rect-translate
  input parameter rect_ :: <TickitRect*>;
  input parameter downward_ :: <C-signed-int>;
  input parameter rightward_ :: <C-signed-int>;
  c-name: "tickit_rect_translate";
end;

define C-function tickit-rect-intersect
  output parameter dst_ :: <TickitRect*>;
  input parameter a_ :: <TickitRect*>;
  input parameter b_ :: <TickitRect*>;
  result res :: <C-boolean>;
  c-name: "tickit_rect_intersect";
end;

define C-function tickit-rect-intersects
  input parameter a_ :: <TickitRect*>;
  input parameter b_ :: <TickitRect*>;
  result res :: <C-boolean>;
  c-name: "tickit_rect_intersects";
end;

define C-function tickit-rect-contains
  input parameter large_ :: <TickitRect*>;
  input parameter small_ :: <TickitRect*>;
  result res :: <C-boolean>;
  c-name: "tickit_rect_contains";
end;

define constant <TickitRect<@3>> = <TickitRect*>;
define C-function tickit-rect-add
  input parameter ret_ :: <TickitRect<@3>>;
  input parameter a_ :: <TickitRect*>;
  input parameter b_ :: <TickitRect*>;
  result res :: <C-signed-int>;
  c-name: "tickit_rect_add";
end;

define constant <TickitRect<@4>> = <TickitRect*>;
define C-function tickit-rect-subtract
  input parameter ret_ :: <TickitRect<@4>>;
  input parameter orig_ :: <TickitRect*>;
  input parameter hole_ :: <TickitRect*>;
  result res :: <C-signed-int>;
  c-name: "tickit_rect_subtract";
end;

define C-struct <TickitRectSet>
end;

define C-pointer-type <TickitRectSet*> => <TickitRectSet>;
define C-function tickit-rectset-new
  result res :: <TickitRectSet*>;
  c-name: "tickit_rectset_new";
end;

define C-function tickit-rectset-destroy
  input parameter trs_ :: <TickitRectSet*>;
  c-name: "tickit_rectset_destroy";
end;

define C-function tickit-rectset-clear
  input parameter trs_ :: <TickitRectSet*>;
  c-name: "tickit_rectset_clear";
end;

define C-function tickit-rectset-rects
  input parameter trs_ :: <TickitRectSet*>;
  result res :: <C-size-t>;
  c-name: "tickit_rectset_rects";
end;

define constant <TickitRect<@>> = <TickitRect*>;
define C-function tickit-rectset-get-rects
  input parameter trs_ :: <TickitRectSet*>;
  input parameter rects_ :: <TickitRect<@>>;
  input parameter n_ :: <C-size-t>;
  result res :: <C-size-t>;
  c-name: "tickit_rectset_get_rects";
end;

define C-function tickit-rectset-add
  input parameter trs_ :: <TickitRectSet*>;
  input parameter rect_ :: <TickitRect*>;
  c-name: "tickit_rectset_add";
end;

define C-function tickit-rectset-subtract
  input parameter trs_ :: <TickitRectSet*>;
  input parameter rect_ :: <TickitRect*>;
  c-name: "tickit_rectset_subtract";
end;

define C-function tickit-rectset-translate
  input parameter trs_ :: <TickitRectSet*>;
  input parameter downward_ :: <C-signed-int>;
  input parameter rightward_ :: <C-signed-int>;
  c-name: "tickit_rectset_translate";
end;

define C-function tickit-rectset-intersects
  input parameter trs_ :: <TickitRectSet*>;
  input parameter rect_ :: <TickitRect*>;
  result res :: <C-boolean>;
  c-name: "tickit_rectset_intersects";
end;

define C-function tickit-rectset-contains
  input parameter trs_ :: <TickitRectSet*>;
  input parameter rect_ :: <TickitRect*>;
  result res :: <C-boolean>;
  c-name: "tickit_rectset_contains";
end;

define C-struct <TickitTerm>
end;

define C-pointer-type <TickitTerm*> => <TickitTerm>;
define constant <TickitTermOutputFunc> = <C-function-pointer>;
define C-function tickit-term-new
  result res :: <TickitTerm*>;
  c-name: "tickit_term_new";
end;

define C-function tickit-term-new-for-termtype
  input parameter termtype_ :: <C-string>;
  result res :: <TickitTerm*>;
  c-name: "tickit_term_new_for_termtype";
end;

define C-function tickit-term-destroy
  input parameter tt_ :: <TickitTerm*>;
  c-name: "tickit_term_destroy";
end;

define C-function tickit-term-open-stdio
  result res :: <TickitTerm*>;
  c-name: "tickit_term_open_stdio";
end;

define C-function tickit-term-get-termtype
  input parameter tt_ :: <TickitTerm*>;
  result res :: <C-string>;
  c-name: "tickit_term_get_termtype";
end;

define C-function tickit-term-set-output-fd
  input parameter tt_ :: <TickitTerm*>;
  input parameter fd_ :: <C-signed-int>;
  c-name: "tickit_term_set_output_fd";
end;

define C-function tickit-term-get-output-fd
  input parameter tt_ :: <TickitTerm*>;
  result res :: <C-signed-int>;
  c-name: "tickit_term_get_output_fd";
end;

define C-pointer-type <TickitTermOutputFunc*> => <TickitTermOutputFunc>;
define C-function tickit-term-set-output-func
  input parameter tt_ :: <TickitTerm*>;
  input parameter fn_ :: <TickitTermOutputFunc*>;
  input parameter user_ :: <C-void*>;
  c-name: "tickit_term_set_output_func";
end;

define C-function tickit-term-set-output-buffer
  input parameter tt_ :: <TickitTerm*>;
  input parameter len_ :: <C-size-t>;
  c-name: "tickit_term_set_output_buffer";
end;

define C-function tickit-term-await-started
  input parameter tt_ :: <TickitTerm*>;
  input parameter msec_ :: <C-signed-long>;
  c-name: "tickit_term_await_started_msec";
end;

define C-function tickit-term-flush
  input parameter tt_ :: <TickitTerm*>;
  c-name: "tickit_term_flush";
end;

define C-function tickit-term-set-input-fd
  input parameter tt_ :: <TickitTerm*>;
  input parameter fd_ :: <C-signed-int>;
  c-name: "tickit_term_set_input_fd";
end;

define C-function tickit-term-get-input-fd
  input parameter tt_ :: <TickitTerm*>;
  result res :: <C-signed-int>;
  c-name: "tickit_term_get_input_fd";
end;

define C-function tickit-term-get-utf8
  input parameter tt_ :: <TickitTerm*>;
  result res :: <TickitMaybeBool>;
  c-name: "tickit_term_get_utf8";
end;

define C-function tickit-term-set-utf8
  input parameter tt_ :: <TickitTerm*>;
  input parameter utf8_ :: <C-boolean>;
  c-name: "tickit_term_set_utf8";
end;

define C-function tickit-term-input-push-bytes
  input parameter tt_ :: <TickitTerm*>;
  input parameter bytes_ :: <C-string>;
  input parameter len_ :: <C-size-t>;
  c-name: "tickit_term_input_push_bytes";
end;

define C-function tickit-term-input-readable
  input parameter tt_ :: <TickitTerm*>;
  c-name: "tickit_term_input_readable";
end;

define C-function tickit-term-input-check-timeout
  input parameter tt_ :: <TickitTerm*>;
  result res :: <C-signed-int>;
  c-name: "tickit_term_input_check_timeout_msec";
end;

define C-function tickit-term-input-wait
  input parameter tt_ :: <TickitTerm*>;
  input parameter msec_ :: <C-signed-long>;
  c-name: "tickit_term_input_wait_msec";
end;

define C-pointer-type <int*> => <C-signed-int>;
define C-function tickit-term-get-size
  input parameter tt_ :: <TickitTerm*>;
  output parameter lines_ :: <int*>;
  output parameter cols_ :: <int*>;
  c-name: "tickit_term_get_size";
end;

define C-function tickit-term-set-size
  input parameter tt_ :: <TickitTerm*>;
  input parameter lines_ :: <C-signed-int>;
  input parameter cols_ :: <C-signed-int>;
  c-name: "tickit_term_set_size";
end;

define C-function tickit-term-refresh-size
  input parameter tt_ :: <TickitTerm*>;
  c-name: "tickit_term_refresh_size";
end;

define C-function tickit-term-observe-sigwinch
  input parameter tt_ :: <TickitTerm*>;
  input parameter observe_ :: <C-boolean>;
  c-name: "tickit_term_observe_sigwinch";
end;

define constant <TickitTermEventFn> = <C-function-pointer>;
define C-pointer-type <TickitTermEventFn*> => <TickitTermEventFn>;
define C-function tickit-term-bind-event
  input parameter tt_ :: <TickitTerm*>;
  input parameter ev_ :: <TickitEventType>;
  input parameter fn_ :: <TickitTermEventFn*>;
  input parameter user_ :: <C-void*>;
  result res :: <C-signed-int>;
  c-name: "tickit_term_bind_event";
end;

define C-function tickit-term-unbind-event-id
  input parameter tt_ :: <TickitTerm*>;
  input parameter id_ :: <C-signed-int>;
  c-name: "tickit_term_unbind_event_id";
end;

define C-function tickit-term-print
  input parameter tt_ :: <TickitTerm*>;
  input parameter str_ :: <C-string>;
  c-name: "tickit_term_print";
end;

define C-function tickit-term-printn
  input parameter tt_ :: <TickitTerm*>;
  input parameter str_ :: <C-string>;
  input parameter len_ :: <C-size-t>;
  c-name: "tickit_term_printn";
end;

define C-function tickit-term-goto
  input parameter tt_ :: <TickitTerm*>;
  input parameter line_ :: <C-signed-int>;
  input parameter col_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "tickit_term_goto";
end;

define C-function tickit-term-move
  input parameter tt_ :: <TickitTerm*>;
  input parameter downward_ :: <C-signed-int>;
  input parameter rightward_ :: <C-signed-int>;
  c-name: "tickit_term_move";
end;

define C-function tickit-term-scrollrect
  input parameter tt_ :: <TickitTerm*>;
  input parameter rect_ :: <TickitRect>;
  input parameter downward_ :: <C-signed-int>;
  input parameter rightward_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "tickit_term_scrollrect";
end;

define C-function tickit-term-chpen
  input parameter tt_ :: <TickitTerm*>;
  input parameter pen_ :: <TickitPen*>;
  c-name: "tickit_term_chpen";
end;

define C-function tickit-term-setpen
  input parameter tt_ :: <TickitTerm*>;
  input parameter pen_ :: <TickitPen*>;
  c-name: "tickit_term_setpen";
end;

define C-function tickit-term-clear
  input parameter tt_ :: <TickitTerm*>;
  c-name: "tickit_term_clear";
end;

define C-function tickit-term-erasech
  input parameter tt_ :: <TickitTerm*>;
  input parameter count_ :: <C-signed-int>;
  input parameter moveend_ :: <TickitMaybeBool>;
  c-name: "tickit_term_erasech";
end;

define constant <TickitTermCtl> = <C-int>;
define constant $TICKIT-TERMCTL-ALTSCREEN = 1;
define constant $TICKIT-TERMCTL-CURSORVIS = 2;
define constant $TICKIT-TERMCTL-MOUSE = 3;
define constant $TICKIT-TERMCTL-CURSORBLINK = 4;
define constant $TICKIT-TERMCTL-CURSORSHAPE = 5;
define constant $TICKIT-TERMCTL-ICON-TEXT = 6;
define constant $TICKIT-TERMCTL-TITLE-TEXT = 7;
define constant $TICKIT-TERMCTL-ICONTITLE-TEXT = 8;
define constant $TICKIT-TERMCTL-KEYPAD-APP = 9;
define constant $TICKIT-TERMCTL-COLORS = 10;

define constant <TickitTermMouseMode> = <C-int>;
define constant $TICKIT-TERM-MOUSEMODE-OFF = 0;
define constant $TICKIT-TERM-MOUSEMODE-CLICK = 1;
define constant $TICKIT-TERM-MOUSEMODE-DRAG = 2;
define constant $TICKIT-TERM-MOUSEMODE-MOVE = 3;

define constant <TickitCursorShape> = <C-int>;
define constant $TICKIT-CURSORSHAPE-BLOCK = 1;
define constant $TICKIT-CURSORSHAPE-UNDER = 2;
define constant $TICKIT-CURSORSHAPE-LEFT-BAR = 3;

define C-function tickit-term-getctl-int
  input parameter tt_ :: <TickitTerm*>;
  input parameter ctl_ :: <TickitTermCtl>;
  output parameter value_ :: <int*>;
  result res :: <C-boolean>;
  c-name: "tickit_term_getctl_int";
end;

define C-function tickit-term-setctl-int
  input parameter tt_ :: <TickitTerm*>;
  input parameter ctl_ :: <TickitTermCtl>;
  input parameter value_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "tickit_term_setctl_int";
end;

define C-function tickit-term-setctl-str
  input parameter tt_ :: <TickitTerm*>;
  input parameter ctl_ :: <TickitTermCtl>;
  input parameter value_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "tickit_term_setctl_str";
end;

define C-function tickit-string-seqlen
  input parameter codepoint_ :: <C-signed-long>;
  result res :: <C-signed-int>;
  c-name: "tickit_string_seqlen";
end;

define C-function tickit-string-putchar
  input parameter str_ :: <C-string>;
  input parameter len_ :: <C-size-t>;
  input parameter codepoint_ :: <C-signed-long>;
  result res :: <C-size-t>;
  c-name: "tickit_string_putchar";
end;

define C-struct <TickitStringPos>
  sealed slot TickitStringPos$bytes :: <C-size-t>;
  sealed slot TickitStringPos$codepoints :: <C-signed-int>;
  sealed slot TickitStringPos$graphemes :: <C-signed-int>;
  sealed slot TickitStringPos$columns :: <C-signed-int>;
end;

define C-pointer-type <TickitStringPos*> => <TickitStringPos>;
define C-function tickit-string-count
  input parameter str_ :: <C-string>;
  input parameter pos_ :: <TickitStringPos*>;
  input parameter limit_ :: <TickitStringPos*>;
  result res :: <C-size-t>;
  c-name: "tickit_string_count";
end;

define C-function tickit-string-countmore
  input parameter str_ :: <C-string>;
  input parameter pos_ :: <TickitStringPos*>;
  input parameter limit_ :: <TickitStringPos*>;
  result res :: <C-size-t>;
  c-name: "tickit_string_countmore";
end;

define C-function tickit-string-ncount
  input parameter str_ :: <C-string>;
  input parameter len_ :: <C-size-t>;
  input parameter pos_ :: <TickitStringPos*>;
  input parameter limit_ :: <TickitStringPos*>;
  result res :: <C-size-t>;
  c-name: "tickit_string_ncount";
end;

define C-function tickit-string-ncountmore
  input parameter str_ :: <C-string>;
  input parameter len_ :: <C-size-t>;
  input parameter pos_ :: <TickitStringPos*>;
  input parameter limit_ :: <TickitStringPos*>;
  result res :: <C-size-t>;
  c-name: "tickit_string_ncountmore";
end;

define C-function tickit-string-mbswidth
  input parameter str_ :: <C-string>;
  result res :: <C-signed-int>;
  c-name: "tickit_string_mbswidth";
end;

define C-function tickit-string-byte2col
  input parameter str_ :: <C-string>;
  input parameter byte_ :: <C-size-t>;
  result res :: <C-signed-int>;
  c-name: "tickit_string_byte2col";
end;

define C-function tickit-string-col2byte
  input parameter str_ :: <C-string>;
  input parameter col_ :: <C-signed-int>;
  result res :: <C-size-t>;
  c-name: "tickit_string_col2byte";
end;

define C-struct <TickitRenderBuffer>
end;

define C-pointer-type <TickitRenderBuffer*> => <TickitRenderBuffer>;
define C-function tickit-renderbuffer-new
  input parameter lines_ :: <C-signed-int>;
  input parameter cols_ :: <C-signed-int>;
  result res :: <TickitRenderBuffer*>;
  c-name: "tickit_renderbuffer_new";
end;

define C-function tickit-renderbuffer-destroy
  input parameter rb_ :: <TickitRenderBuffer*>;
  c-name: "tickit_renderbuffer_destroy";
end;

define C-function tickit-renderbuffer-get-size
  input parameter rb_ :: <TickitRenderBuffer*>;
  output parameter lines_ :: <int*>;
  output parameter cols_ :: <int*>;
  c-name: "tickit_renderbuffer_get_size";
end;

define C-function tickit-renderbuffer-translate
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter downward_ :: <C-signed-int>;
  input parameter rightward_ :: <C-signed-int>;
  c-name: "tickit_renderbuffer_translate";
end;

define C-function tickit-renderbuffer-clip
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter rect_ :: <TickitRect*>;
  c-name: "tickit_renderbuffer_clip";
end;

define C-function tickit-renderbuffer-mask
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter mask_ :: <TickitRect*>;
  c-name: "tickit_renderbuffer_mask";
end;

define C-function tickit-renderbuffer-has-cursorpos
  input parameter rb_ :: <TickitRenderBuffer*>;
  result res :: <C-boolean>;
  c-name: "tickit_renderbuffer_has_cursorpos";
end;

define C-function tickit-renderbuffer-get-cursorpos
  input parameter rb_ :: <TickitRenderBuffer*>;
  output parameter line_ :: <int*>;
  output parameter col_ :: <int*>;
  c-name: "tickit_renderbuffer_get_cursorpos";
end;

define C-function tickit-renderbuffer-goto
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter line_ :: <C-signed-int>;
  input parameter col_ :: <C-signed-int>;
  c-name: "tickit_renderbuffer_goto";
end;

define C-function tickit-renderbuffer-ungoto
  input parameter rb_ :: <TickitRenderBuffer*>;
  c-name: "tickit_renderbuffer_ungoto";
end;

define C-function tickit-renderbuffer-setpen
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter pen_ :: <TickitPen*>;
  c-name: "tickit_renderbuffer_setpen";
end;

define C-function tickit-renderbuffer-reset
  input parameter rb_ :: <TickitRenderBuffer*>;
  c-name: "tickit_renderbuffer_reset";
end;

define C-function tickit-renderbuffer-save
  input parameter rb_ :: <TickitRenderBuffer*>;
  c-name: "tickit_renderbuffer_save";
end;

define C-function tickit-renderbuffer-savepen
  input parameter rb_ :: <TickitRenderBuffer*>;
  c-name: "tickit_renderbuffer_savepen";
end;

define C-function tickit-renderbuffer-restore
  input parameter rb_ :: <TickitRenderBuffer*>;
  c-name: "tickit_renderbuffer_restore";
end;

define C-function tickit-renderbuffer-skip-at
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter line_ :: <C-signed-int>;
  input parameter col_ :: <C-signed-int>;
  input parameter cols_ :: <C-signed-int>;
  c-name: "tickit_renderbuffer_skip_at";
end;

define C-function tickit-renderbuffer-skip
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter cols_ :: <C-signed-int>;
  c-name: "tickit_renderbuffer_skip";
end;

define C-function tickit-renderbuffer-skip-to
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter col_ :: <C-signed-int>;
  c-name: "tickit_renderbuffer_skip_to";
end;

define C-function tickit-renderbuffer-text-at
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter line_ :: <C-signed-int>;
  input parameter col_ :: <C-signed-int>;
  input parameter text_ :: <C-string>;
  result res :: <C-signed-int>;
  c-name: "tickit_renderbuffer_text_at";
end;

define C-function tickit-renderbuffer-textn-at
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter line_ :: <C-signed-int>;
  input parameter col_ :: <C-signed-int>;
  input parameter text_ :: <C-string>;
  input parameter len_ :: <C-size-t>;
  result res :: <C-signed-int>;
  c-name: "tickit_renderbuffer_textn_at";
end;

define C-function tickit-renderbuffer-text
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter text_ :: <C-string>;
  result res :: <C-signed-int>;
  c-name: "tickit_renderbuffer_text";
end;

define C-function tickit-renderbuffer-textn
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter text_ :: <C-string>;
  input parameter len_ :: <C-size-t>;
  result res :: <C-signed-int>;
  c-name: "tickit_renderbuffer_textn";
end;

define C-function tickit-renderbuffer-erase-at
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter line_ :: <C-signed-int>;
  input parameter col_ :: <C-signed-int>;
  input parameter cols_ :: <C-signed-int>;
  c-name: "tickit_renderbuffer_erase_at";
end;

define C-function tickit-renderbuffer-erase
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter cols_ :: <C-signed-int>;
  c-name: "tickit_renderbuffer_erase";
end;

define C-function tickit-renderbuffer-erase-to
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter col_ :: <C-signed-int>;
  c-name: "tickit_renderbuffer_erase_to";
end;

define C-function tickit-renderbuffer-eraserect
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter rect_ :: <TickitRect*>;
  c-name: "tickit_renderbuffer_eraserect";
end;

define C-function tickit-renderbuffer-clear
  input parameter rb_ :: <TickitRenderBuffer*>;
  c-name: "tickit_renderbuffer_clear";
end;

define C-function tickit-renderbuffer-char-at
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter line_ :: <C-signed-int>;
  input parameter col_ :: <C-signed-int>;
  input parameter codepoint_ :: <C-signed-long>;
  c-name: "tickit_renderbuffer_char_at";
end;

define C-function tickit-renderbuffer-char
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter codepoint_ :: <C-signed-long>;
  c-name: "tickit_renderbuffer_char";
end;

define constant <TickitLineStyle> = <C-int>;
define constant $TICKIT-LINE-SINGLE = 1;
define constant $TICKIT-LINE-DOUBLE = 2;
define constant $TICKIT-LINE-THICK = 3;

define constant <TickitLineCaps> = <C-int>;
define constant $TICKIT-LINECAP-START = 1;
define constant $TICKIT-LINECAP-END = 2;
define constant $TICKIT-LINECAP-BOTH = 3;

define C-function tickit-renderbuffer-hline-at
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter line_ :: <C-signed-int>;
  input parameter startcol_ :: <C-signed-int>;
  input parameter endcol_ :: <C-signed-int>;
  input parameter style_ :: <TickitLineStyle>;
  input parameter caps_ :: <TickitLineCaps>;
  c-name: "tickit_renderbuffer_hline_at";
end;

define C-function tickit-renderbuffer-vline-at
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter startline_ :: <C-signed-int>;
  input parameter endline_ :: <C-signed-int>;
  input parameter col_ :: <C-signed-int>;
  input parameter style_ :: <TickitLineStyle>;
  input parameter caps_ :: <TickitLineCaps>;
  c-name: "tickit_renderbuffer_vline_at";
end;

define C-function tickit-renderbuffer-flush-to-term
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter tt_ :: <TickitTerm*>;
  c-name: "tickit_renderbuffer_flush_to_term";
end;

define C-function tickit-renderbuffer-blit
  input parameter dst_ :: <TickitRenderBuffer*>;
  input parameter src_ :: <TickitRenderBuffer*>;
  c-name: "tickit_renderbuffer_blit";
end;

define C-struct <TickitRenderBufferLineMask>
  sealed slot TickitRenderBufferLineMask$north :: <C-signed-char>;
  sealed slot TickitRenderBufferLineMask$south :: <C-signed-char>;
  sealed slot TickitRenderBufferLineMask$east :: <C-signed-char>;
  sealed slot TickitRenderBufferLineMask$west :: <C-signed-char>;
end;

define C-function tickit-renderbuffer-get-cell-active
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter line_ :: <C-signed-int>;
  input parameter col_ :: <C-signed-int>;
  result res :: <C-signed-int>;
  c-name: "tickit_renderbuffer_get_cell_active";
end;

define C-function tickit-renderbuffer-get-cell-text
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter line_ :: <C-signed-int>;
  input parameter col_ :: <C-signed-int>;
  input parameter buffer_ :: <C-string>;
  input parameter len_ :: <C-size-t>;
  result res :: <C-size-t>;
  c-name: "tickit_renderbuffer_get_cell_text";
end;

define C-function tickit-renderbuffer-get-cell-pen
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter line_ :: <C-signed-int>;
  input parameter col_ :: <C-signed-int>;
  result res :: <TickitPen*>;
  c-name: "tickit_renderbuffer_get_cell_pen";
end;

define C-struct <TickitRenderBufferSpanInfo>
  sealed slot TickitRenderBufferSpanInfo$is-active :: <C-boolean>;
  sealed slot TickitRenderBufferSpanInfo$n-columns :: <C-signed-int>;
  sealed slot TickitRenderBufferSpanInfo$text :: <C-string>;
  sealed slot TickitRenderBufferSpanInfo$len :: <C-size-t>;
  sealed slot TickitRenderBufferSpanInfo$pen :: <TickitPen*>;
end;

define C-pointer-type <TickitRenderBufferSpanInfo*> => <TickitRenderBufferSpanInfo>;
define C-function tickit-renderbuffer-get-span
  input parameter rb_ :: <TickitRenderBuffer*>;
  input parameter line_ :: <C-signed-int>;
  input parameter startcol_ :: <C-signed-int>;
  input parameter info_ :: <TickitRenderBufferSpanInfo*>;
  input parameter buffer_ :: <C-string>;
  input parameter len_ :: <C-size-t>;
  result res :: <C-size-t>;
  c-name: "tickit_renderbuffer_get_span";
end;

define C-struct <TickitWindow>
end;

define C-pointer-type <TickitWindow*> => <TickitWindow>;
define constant <TickitWindowEventFn> = <C-function-pointer>;
define constant <TickitWindowFlags> = <C-int>;
define constant $TICKIT-WINDOW-HIDDEN = 1;
define constant $TICKIT-WINDOW-LOWEST = 2;
define constant $TICKIT-WINDOW-ROOT-PARENT = 4;
define constant $TICKIT-WINDOW-STEAL-INPUT = 8;
define constant $TICKIT-WINDOW-POPUP = 12;

define C-function tickit-window-new-root
  input parameter term_ :: <TickitTerm*>;
  result res :: <TickitWindow*>;
  c-name: "tickit_window_new_root";
end;

define C-function tickit-window-new
  input parameter parent_ :: <TickitWindow*>;
  input parameter rect_ :: <TickitRect>;
  input parameter flags_ :: <TickitWindowFlags>;
  result res :: <TickitWindow*>;
  c-name: "tickit_window_new";
end;

define C-function tickit-window-parent
  input parameter win_ :: <TickitWindow*>;
  result res :: <TickitWindow*>;
  c-name: "tickit_window_parent";
end;

define C-function tickit-window-root
  input parameter win_ :: <TickitWindow*>;
  result res :: <TickitWindow*>;
  c-name: "tickit_window_root";
end;

define C-function tickit-window-destroy
  input parameter win_ :: <TickitWindow*>;
  c-name: "tickit_window_destroy";
end;

define C-pointer-type <TickitWindowEventFn*> => <TickitWindowEventFn>;
define C-function tickit-window-bind-event
  input parameter win_ :: <TickitWindow*>;
  input parameter ev_ :: <TickitEventType>;
  input parameter fn_ :: <TickitWindowEventFn*>;
  input parameter user_ :: <C-void*>;
  result res :: <C-signed-int>;
  c-name: "tickit_window_bind_event";
end;

define C-function tickit-window-unbind-event-id
  input parameter win_ :: <TickitWindow*>;
  input parameter id_ :: <C-signed-int>;
  c-name: "tickit_window_unbind_event_id";
end;

define C-function tickit-window-raise
  input parameter win_ :: <TickitWindow*>;
  c-name: "tickit_window_raise";
end;

define C-function tickit-window-raise-to-front
  input parameter win_ :: <TickitWindow*>;
  c-name: "tickit_window_raise_to_front";
end;

define C-function tickit-window-lower
  input parameter win_ :: <TickitWindow*>;
  c-name: "tickit_window_lower";
end;

define C-function tickit-window-lower-to-back
  input parameter win_ :: <TickitWindow*>;
  c-name: "tickit_window_lower_to_back";
end;

define C-function tickit-window-show
  input parameter win_ :: <TickitWindow*>;
  c-name: "tickit_window_show";
end;

define C-function tickit-window-hide
  input parameter win_ :: <TickitWindow*>;
  c-name: "tickit_window_hide";
end;

define C-function tickit-window-is-visible
  input parameter win_ :: <TickitWindow*>;
  result res :: <C-boolean>;
  c-name: "tickit_window_is_visible";
end;

define C-function tickit-window-bottom
  input parameter win_ :: <TickitWindow*>;
  result res :: <C-signed-int>;
  c-name: "tickit_window_bottom";
end;

define C-function tickit-window-right
  input parameter win_ :: <TickitWindow*>;
  result res :: <C-signed-int>;
  c-name: "tickit_window_right";
end;

define C-function tickit-window-resize
  input parameter win_ :: <TickitWindow*>;
  input parameter lines_ :: <C-signed-int>;
  input parameter cols_ :: <C-signed-int>;
  c-name: "tickit_window_resize";
end;

define C-function tickit-window-reposition
  input parameter win_ :: <TickitWindow*>;
  input parameter top_ :: <C-signed-int>;
  input parameter left_ :: <C-signed-int>;
  c-name: "tickit_window_reposition";
end;

define C-function tickit-window-set-geometry
  input parameter win_ :: <TickitWindow*>;
  input parameter rect_ :: <TickitRect>;
  c-name: "tickit_window_set_geometry";
end;

define C-function tickit-window-get-pen
  input parameter win_ :: <TickitWindow*>;
  result res :: <TickitPen*>;
  c-name: "tickit_window_get_pen";
end;

define C-function tickit-window-set-pen
  input parameter win_ :: <TickitWindow*>;
  input parameter pen_ :: <TickitPen*>;
  c-name: "tickit_window_set_pen";
end;

define C-function tickit-window-expose
  input parameter win_ :: <TickitWindow*>;
  input parameter exposed_ :: <TickitRect*>;
  c-name: "tickit_window_expose";
end;

define C-function tickit-window-flush
  input parameter win_ :: <TickitWindow*>;
  c-name: "tickit_window_flush";
end;

define C-function tickit-window-scrollrect
  input parameter win_ :: <TickitWindow*>;
  input parameter rect_ :: <TickitRect*>;
  input parameter downward_ :: <C-signed-int>;
  input parameter rightward_ :: <C-signed-int>;
  input parameter pen_ :: <TickitPen*>;
  result res :: <C-boolean>;
  c-name: "tickit_window_scrollrect";
end;

define C-function tickit-window-scroll
  input parameter win_ :: <TickitWindow*>;
  input parameter downward_ :: <C-signed-int>;
  input parameter rightward_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "tickit_window_scroll";
end;

define C-function tickit-window-scroll-with-children
  input parameter win_ :: <TickitWindow*>;
  input parameter downward_ :: <C-signed-int>;
  input parameter rightward_ :: <C-signed-int>;
  result res :: <C-boolean>;
  c-name: "tickit_window_scroll_with_children";
end;

define C-function tickit-window-set-cursor-position
  input parameter win_ :: <TickitWindow*>;
  input parameter line_ :: <C-signed-int>;
  input parameter col_ :: <C-signed-int>;
  c-name: "tickit_window_set_cursor_position";
end;

define C-function tickit-window-set-cursor-visible
  input parameter win_ :: <TickitWindow*>;
  input parameter visible_ :: <C-boolean>;
  c-name: "tickit_window_set_cursor_visible";
end;

define C-function tickit-window-set-cursor-shape
  input parameter win_ :: <TickitWindow*>;
  input parameter shape_ :: <TickitCursorShape>;
  c-name: "tickit_window_set_cursor_shape";
end;

define C-function tickit-window-take-focus
  input parameter win_ :: <TickitWindow*>;
  c-name: "tickit_window_take_focus";
end;

define C-function tickit-window-is-focused
  input parameter win_ :: <TickitWindow*>;
  result res :: <C-boolean>;
  c-name: "tickit_window_is_focused";
end;

define C-function tickit-window-set-focus-child-notify
  input parameter win_ :: <TickitWindow*>;
  input parameter notify_ :: <C-boolean>;
  c-name: "tickit_window_set_focus_child_notify";
end;

define C-function tickit-debug-init
  c-name: "tickit_debug_init";
end;

 /* Ignoring declaration for {<variable-declaration> name: tickit_debug_enabled} "tickit-debug-enabled"*/
define C-function tickit-debug-open
  input parameter path_ :: <C-string>;
  result res :: <C-boolean>;
  c-name: "tickit_debug_open";
end;

define C-struct <TickitResizeEventInfo>
  sealed slot TickitResizeEventInfo$lines :: <C-signed-int>;
  sealed slot TickitResizeEventInfo$cols :: <C-signed-int>;
end;

define constant <TickitKeyEventType> = <C-int>;
define constant $TICKIT-KEYEV-KEY = 1;
define constant $TICKIT-KEYEV-TEXT = 2;

define C-struct <TickitKeyEventInfo>
  sealed slot TickitKeyEventInfo$type :: <TickitKeyEventType>;
  sealed slot TickitKeyEventInfo$mod :: <C-signed-int>;
  sealed slot TickitKeyEventInfo$str :: <C-string>;
end;

define constant <TickitMouseEventType> = <C-int>;
define constant $TICKIT-MOUSEEV-PRESS = 1;
define constant $TICKIT-MOUSEEV-DRAG = 2;
define constant $TICKIT-MOUSEEV-RELEASE = 3;
define constant $TICKIT-MOUSEEV-WHEEL = 4;

define constant $TICKIT-MOUSEWHEEL-UP = 1;
define constant $TICKIT-MOUSEWHEEL-DOWN = 2;

define C-struct <TickitMouseEventInfo>
  sealed slot TickitMouseEventInfo$type :: <TickitMouseEventType>;
  sealed slot TickitMouseEventInfo$button :: <C-signed-int>;
  sealed slot TickitMouseEventInfo$mod :: <C-signed-int>;
  sealed slot TickitMouseEventInfo$line :: <C-signed-int>;
  sealed slot TickitMouseEventInfo$col :: <C-signed-int>;
end;

define constant $TICKIT-MOD-SHIFT = 1;
define constant $TICKIT-MOD-ALT = 2;
define constant $TICKIT-MOD-CTRL = 4;

define C-struct <TickitGeomchangeEventInfo>
  sealed slot TickitGeomchangeEventInfo$rect :: <TickitRect>;
  sealed slot TickitGeomchangeEventInfo$oldrect :: <TickitRect>;
end;

define C-struct <TickitExposeEventInfo>
  sealed slot TickitExposeEventInfo$rect :: <TickitRect>;
  sealed slot TickitExposeEventInfo$rb :: <TickitRenderBuffer*>;
end;

define constant <TickitFocusEventType> = <C-int>;
define constant $TICKIT-FOCUSEV-IN = 1;
define constant $TICKIT-FOCUSEV-OUT = 2;

define C-struct <TickitFocusEventInfo>
  sealed slot TickitFocusEventInfo$type :: <TickitFocusEventType>;
  sealed slot TickitFocusEventInfo$win :: <TickitWindow*>;
end;

