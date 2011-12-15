vm     = require 'vm'
extend = require('extenze').extend
unmix  = require('extenze').unmix

exe = (code, sandbox={}, next) ->
  
  # node stuff for v8 vm
  nodeMixins = 
    global     : global
    module     : module
    process    : process
    require    : require
    __filename : __filename
    __dirname  : __dirname

  # mixin node stuff
  sandbox = extend sandbox, nodeMixins

  try
    # run code with sandbox in vm
    vm.runInNewContext code, sandbox    
    next 
      status: 'ok'
      # take out node stuff from sandbox
      sandbox: unmix sandbox, nodeMixins   
  catch err 
    next
      status: 'fail'
      # take out node stuff from sandbox
      sandbox: unmix sandbox, nodeMixins   
      error: err      


module.exports = exe
