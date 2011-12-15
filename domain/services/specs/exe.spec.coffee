#>> Setup

should = require 'should'
exe = require '../exe'

#>> Given some code

code = "foo = 'baz';"

#>> And a sandbox with the should lib

sandbox = 
  foo: 'foo'

#>> When the code is run in boxy

exe code, sandbox, (result) -> 

  result.status.should.equal 'ok'
  result.sandbox.foo.should.equal 'baz'


#>> Given some bad code 

code = "mee not so smaart"

#>> When the code is run in boxy

exe code, sandbox, (result) -> 

  result.status.should.equal 'fail'
  result.error.message.should.equal "Unexpected identifier"

