import Lean

open Lean Elab Command Term

/-

A sample program should look like:

```
def sum  (arr : [int]) : -> int {
  let mut sum : int := 0;
  for (elem : int) in iter(arr) {
    sum := sum + elem;
  }
  return sum;
}
```

-/
declare_syntax_cat unit
syntax "()" : unit

declare_syntax_cat bool
syntax ident : bool
syntax "true" : bool
syntax "false" : bool
syntax bool "and" bool : bool
syntax bool "or" bool : bool
syntax "not" bool : bool

declare_syntax_cat int
syntax ident : int
syntax num : int
syntax int "+" int : int
syntax int "-" int : int
syntax int "*" int : int

declare_syntax_cat list
syntax ident : list
syntax "[" int,* "]" : list
syntax list "++" list : list
syntax "push_front" "(" list "," int ")" : list
syntax "push_back" "(" list "," int ")" : list

-- an alternative would be `syntax "[" value,* "]" : value
declare_syntax_cat value
syntax:80 int : value
syntax:80 bool : value
syntax:80 list : value
syntax:80 ident : value

declare_syntax_cat type
syntax "unit" : type
syntax "bool" : type
syntax "int" : type
syntax "[" type "]" : type
syntax type "->" type : type

syntax typed_ident := ident ":" type

-- declare_syntax_cat typed_value
-- syntax "(" value ":" type ")" : typed_value

declare_syntax_cat line
syntax ("let")? ("mut")? ident (":" type)? ":=" value ";" : line
syntax (name := return_line) "return" value ";" : line
syntax (name := block) "{" line* "}" : line
syntax (name := for_loop) "for" ident "in" "iter(" list ")" block : line
syntax (name := definition_line) "def" ident "("typed_ident,* ")" ":" "->" type block : line

elab (name := frEb) "```fr∃b" ppLine line ppLine "```" : command => do
 logInfo s!"Not implemented!"

```fr∃b
def sum (arr : [int]) : -> int {
  let mut sum : int := 0;
  for elem in iter(arr) {
    sum := sum + elem;
  }
  return sum;
}
```
