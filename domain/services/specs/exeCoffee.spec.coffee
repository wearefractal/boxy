#>> Setup

should = require 'should'
exeCoffee = require '../exeCoffee'

#>> Given some CoffeeScript code

code = "foo = 'baz'"

#>> And a sandbox with the should lib

sandbox = 
  foo: 'foo'

#>> When the code is run in boxy

exeCoffee code, sandbox, (result) -> 

  result.status.should.equal 'ok'
  result.sandbox.foo.should.equal 'baz'

