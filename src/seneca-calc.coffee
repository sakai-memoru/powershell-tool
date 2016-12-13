# out: ../lib/$1.js
###
#
###

# custom module
sum = require('./sumTwoNumbers')
double = require('./doubleNumber')

# action pattern
ptn_sum =
  role: 'math'
  cmd: 'sum'

# register a pattern and a callback function to seneca plugin
sum_plugin = (options) ->
  # register rules with this keyword
  @add ptn_sum, (param, respond_cb) ->
    err = null
    ret = sum(param)
    respond_cb err, 'retVal': ret
    return
  return

# action pattern
ptn_double =
  role: 'math'
  cmd: 'double'

double_plugin = (options) ->
  # register rules with this keyword
  @add ptn_double, (param, respond_cb) ->
    err = null
    ret = double(param)
    respond_cb err, 'retVal': ret
    return
  return

# action pattern
ptn_calculate =
  role: 'math'
  cmd: 'calculate'

calculate_plugin = (options) ->
  # register rules with this keyword
  @add ptn_calculate, (param, respond_cb) ->
    err = null
    msg = {}
    msg.num = sum(param)
    ret = double(msg)
    respond_cb err, 'retVal': ret
    return
  return



module.exports = sum_plugin
module.exports = double_plugin
module.exports = calculate_plugin
