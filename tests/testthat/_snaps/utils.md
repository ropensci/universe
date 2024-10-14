# assert_character() works

    Code
      assert_character(1L, "universe")
    Condition
      Error:
      ! `name` must be a character of length 1.
    Code
      assert_character(c("bla", "blop"), "universe")
    Condition
      Error:
      ! `name` must be a character of length 1.

