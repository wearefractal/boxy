coffee = require 'coffee-script'
exe = require './exe'

exeCoffee = (code, sandbox={}, next) ->

  code = coffee.compile code, {bare: true}  
  exe code, sandbox, next


module.exports = exeCoffee
