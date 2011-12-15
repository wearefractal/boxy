#>> Setup

should = require 'should'
exe = require '../exeCoffee'

#>> Given some code

code = 
  '''
  useless = require 'useless'
  useless.should.be.ok
  '''
  
#>> And a sandbox with the should lib

sandbox = {}

#>> When the code is run in boxy

exe code, sandbox, (result) -> 

  result.status.should.equal 'ok'

