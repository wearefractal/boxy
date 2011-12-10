log = require 'node-log'

NodeSandbox =

  eval: (code, sandbox) ->

    # bind sandbox vars to local scope accessible with @
    # @[name] = val for name, val of sandbox

    try
      eval code
      return result =
        status: 'ok'
        sandbox: sandbox

    catch err
      return result =
        status: 'fail'
        sandbox: sandbox
        error: err

module.exports = NodeSandbox

### TEST

should = require 'should'

#>> Given some code

code =
  "this.spex = 'changed';" +
  "this.spex.should.equal('changed');"


#>> And a sandbox with the should lib

sandbox =
  spex: 'myspex'
  should: require 'should'

#>> When the code is run in NodeSandbox

result = NodeSandbox.eval code, sandbox

#>> It should run ok (assertions pass)

result.should.not.have.property 'nodeSandboxError'

#>> And

result.sandbox.spex.should.equal 'changed'

