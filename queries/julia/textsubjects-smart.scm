((line_comment) @_start @_end
     (#make-range! "range" @_start @_end))

; TODO This query doesn't work for comment groups at the start and end of a
; file
; See https://github.com/tree-sitter/tree-sitter/issues/1138
(((_) @head . (line_comment) @_start . (line_comment)+ @_end (_) @tail)
    (#not-has-type? @tail "comment")
    (#not-has-type? @head "comment")
    (#make-range! "range" @_start @_end))

(([
    (function_definition)
    (struct_definition)
    (while_statement)
    (for_statement)
    (if_statement)
    (try_statement)
    (do_clause)
    (vector_expression)
    (tuple_expression)
] @_start @_end)
(#make-range! "range" @_start @_end))

((parameter_list (_) @_start @_end . ","? @_end)
    (#make-range! "range" @_start @_end))

((argument_list (_) @_start @_end . ","? @_end)
    (#make-range! "range" @_start @_end))

((tuple_expression (_) @_start @_end . ","? @_end)
    (#make-range! "range" @_start @_end))

((vector_expression (_) @_start @_end . ","? @_end)
    (#make-range! "range" @_start @_end))

;((type_argument_list (_) @_start @_end . ","? @_end)
;    (#make-range! "range" @_start @_end))

((return_statement (_) @_start @_end)
    (#make-range! "range" @_start @_end))
