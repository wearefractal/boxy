vm     = require 'vm'
extend = require('extenze').extend
unmix  = require('extenze').unmix

exe = ({code, sandbox, filename, next}) ->

  # node stuff for v8 vm
  nodeMixins = 
    module  : module
    process : process
    require : require

  # mixin node stuff
  sandbox = extend sandbox, global
  sandbox = extend sandbox, nodeMixins

  try
    # run code with sandbox in vm
    vm.runInNewContext code, sandbox, filename
    next? result =
      status: 'ok'
      # take out node stuff from sandbox
      sandbox: unmix sandbox, nodeMixins   
  catch err 
    next? result =
      status: 'fail'
      # take out node stuff from sandbox
      sandbox: unmix sandbox, nodeMixins   
      error: err      


module.exports = exe
