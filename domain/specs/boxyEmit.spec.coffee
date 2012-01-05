#>> Setup

should = require 'should'
BoxySandbox = require '../BoxySandbox'

#>> Given some code that emits a boxy event

code =

  '''
  console.log JSON.stringify
    'boxy.events':
      event: 'foo'
      value: 'bar'
  '''

#>> And a sandbox

sandbox = new BoxySandbox
  cwd: "/home/codex/apps/slice"      

#>> When a a 'foo' event is fired

sandbox.on 'foo', (foo) -> 

#>> Then

  foo.should.equal "bar"

#>> And When the process exists

sandbox.on 'exit', (code) -> 

#>> Then the exit code should be '0'

  code.should.equal 0


#>> execute

sandbox.exe code


###
sandbox.on 'out', (output) -> console.log "got some output: " + output
sandbox.on 'err', (err) -> console.log "error: " + err
sandbox.on 'exit', (code) -> 

