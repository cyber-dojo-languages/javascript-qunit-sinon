
lambda { |stdout,stderr,status|
  output = stdout + stderr
  died_pattern = /Died on test/
  return :amber if died_pattern.match(output)
  qunit_pattern = /\W*\d+\W+\d+\W+\d+\W+(\d+)\W+(\d+)\W+\d+\W+/
  if match = qunit_pattern.match(output)
    match[1] == '0' ? :green : :red
  else
   :amber
  end
}
