
lambda { |stdout,stderr,status|
  output = stdout + stderr

  js_hint_pattern = /^(\d+) error(s?)/
  return :amber if js_hint_pattern.match(output)

  died_pattern = /Died on test/
  return :amber if died_pattern.match(output)

  red_pattern = /\d+ tests of \d+ passed, \d+ failed/
  return :red if red_pattern.match(output)

  green_pattern = /\d+ tests of \d+ passed\./
  return :green if green_pattern.match(output)

  return :amber
}
