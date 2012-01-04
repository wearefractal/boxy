vm     = require 'vm'
extend = require('extenze').extend
unmix  = require('extenze').unmix

exe = ({code, sandbox, filename, next}) ->
  
  ###
  # node stuff for v8 vm
  nodeMixins = 
    global  : global
    module  : module
    process : process
    require : require

  # mixin node stuff
  sandbox = extend sandbox, nodeMixins
  ###

  try

    # TODO can't get 'should' to run with vm :/
    # run code with sandbox in vm
    # vm.runInNewContext code, sandbox

    eval code, sandbox    
    next? result =
      status: 'ok'

      # take out node stuff from sandbox
      # sandbox: unmix sandbox, nodeMixins   

      sandbox: sandbox  

  catch err 
    next? result =
      status: 'fail'

      # take out node stuff from sandbox
      # sandbox: unmix sandbox, nodeMixins   

      sandbox: sandbox  
      error: err      


module.exports = exe
