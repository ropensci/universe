# universe_one_package() errors well

    Code
      universe_one_package("jeroen", package = "shiny")
    Condition
      Error in `universe_one_package()`:
      ! Can't find package shiny in universe jeroen.

# assert_universe() works

    Code
      universe_all_packages("thisisnotanuniversenameok")
    Condition
      Error in `universe_all_packages()`:
      ! Can't find `universe` "thisisnotanuniversenameok" in existing universes.
      i Maybe you made a typo?

