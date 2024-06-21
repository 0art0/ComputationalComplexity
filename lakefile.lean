import Lake
open Lake DSL

package «ComputationalComplexity» where
  -- add package configuration options here

lean_lib «ComputationalComplexity» where
  -- add library configuration options here

@[default_target]
lean_exe «computationalcomplexity» where
  root := `Main

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"
