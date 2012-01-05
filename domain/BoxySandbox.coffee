EventEmitter = require('events').EventEmitter
spawn        = require('child_process').spawn
coffee       = require 'coffee-script'

isJSONString = (str) ->
  try 
    JSON.parse str
  catch e
    console.log "err: " + e
    return false

  return true


class BoxySandbox extends EventEmitter

  constructor: ({ @sandbox, @cwd, isCoffee }) ->
  exe: (code) ->        
    args = 
      cwd: @cwd

    # coffee - TODO: change to node
    runner = spawn "coffee", ['-s'], args

    # write stream to `runner`
    runner.stdin.write code
    runner.stdin.end()

    # stdout
    runner.stdout.on 'data', (data) => 
      data = data.toString()
      if isJSONString data
        obj = JSON.parse data
        if obj?['boxy.event']?
          @emitOut obj['boxy.event']
        else
          @out obj
      else
       @out data

    # err
    runner.stderr.on 'data', (err) => @err err

    # exit
    runner.on 'exit', (code) => @exit code

  emitOut: ({event, value}) -> @emit event, value
  out: (data) -> @emit 'out', data
  err: (err) -> @emit 'err', err
  exit: (code) -> @emit 'exit', code

  ###
  boxy.emit: (event, val) -> 
    console.log JSON.stringify 
      'boxy.event':
        event: event
        value: val
  ###

module.exports = BoxySandbox
