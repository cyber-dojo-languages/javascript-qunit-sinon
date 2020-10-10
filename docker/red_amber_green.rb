
lambda { |stdout,stderr,status|
  output = stdout + stderr

  died_pattern = /Died on test/
  return :amber if died_pattern.match(output)

  red_pattern = /\d+ tests of \d+ passed, \d+ failed/
  return :red if red_pattern.match(output)

  green_pattern = /\d+ tests of \d+ passed\./
  return :green if green_pattern.match(output)

  return :amber
}
