#require('coffee-script');
#exe = require './services/exe' # vm version
#exeCoffee = require './services/exeCoffee'
boxySandbox = require './BoxySandbox'

Boxy =

#  exe: (code, sandbox, next) -> exe code, sandbox, next
#  exeCoffee: (code, sandbox, next) -> exe code, sandbox, next

  BoxySandbox: (args) -> new boxySandbox(args)

module.exports = Boxy
