# out: ../lib/$1.js

_ = require('lodash')
seneca = require('seneca')()

seneca.use('seneca-calc')
seneca.listen();

# debug
ptn =
  role: 'math'
  cmd: 'calculate'

arg =
  left: 10
  right: 12

param = _.merge(ptn, arg)
seneca.act param, (err, result) ->
  console.log 'result value = ' + result.retVal
  return
