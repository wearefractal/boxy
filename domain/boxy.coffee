require('coffee-script');
exe = require './services/exe'

Boxy =

  exe: (code, sandbox) -> exe code, sandbox

module.exports = Boxy
