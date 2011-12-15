require('coffee-script');
exe = require './services/exe'
exeCoffee = require './services/exeCoffee'

Boxy =

  exe: (code, sandbox, next) -> exe code, sandbox, next
  exeCoffee: (code, sandbox, next) -> exe code, sandbox, next

module.exports = Boxy
