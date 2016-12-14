###
# Calculation service
* @overview　計算用library microservice
* @description
###
_ = require('lodash')
seneca = require('seneca')()

seneca.use('seneca-calc-plugin')
seneca.listen();

# # debug
# ptn_calc =
#   role: 'math'
#   cmd: 'calculate'
#
# arg_calc =
#   left: 10
#   right: 12
#
# param_calc = _.merge(ptn_calc, arg_calc)
# seneca.act param_calc, (err, result) ->
#   console.log 'result value = ' + result.retVal
#   return
#
# # debug
# ptn_sum =
#   role: 'math'
#   cmd: 'sum'
#
# arg_sum =
#   left: 10
#   right: 12
#
# param_sum = _.merge(ptn_sum, arg_sum)
# seneca.act param_sum, (err, result) ->
#   console.log 'result value = ' + result.retVal
#   return
#
# # debug
# ptn_double =
#   role: 'math'
#   cmd: 'double'
#
# arg_double =
#   num: 10
#
# param_double = _.merge(ptn_double, arg_double)
# seneca.act param_double, (err, result) ->
#   console.log 'result value = ' + result.retVal
#   return
