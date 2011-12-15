#>> Setup

should = require 'should'
exe = require '../exeCoffee'

#>> Given some code

code = 
  '''
  cwd = process.cwd()
  '''
  
#>> And a sandbox with the should lib

sandbox =
  cwd: 'foo'

#>> When the code is run in boxy

exe code, sandbox, (result) -> 

  result.status.should.equal 'ok'

