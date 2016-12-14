###
# Calculation plugin for seneca
* @overview　
  - seneca用plugin module
* @description

| role | cmd       | arg                  | return | description                          |
|------|-----------|----------------------|--------|--------------------------------------|
| math | sum       | {right:123,left:123} | 246    | ２つの数字を足す                     |
| math | double    | {num : 123}          | 246    | 数字を２倍にする                     |
| math | calculate | {right:123,left:123} | 492    | ２つの数字を足して、それを２倍にする |

* @dependencies
  - calc.js
###


# custom module
sum = require('./calc').sum
double = require('./calc').double

# action pattern
ptn_sum =
  role: 'math'
  cmd: 'sum'

# action pattern
ptn_double =
  role: 'math'
  cmd: 'double'

# action pattern
ptn_calculate =
  role: 'math'
  cmd: 'calculate'

# register a pattern and a callback function to seneca plugin
calc_plugin = (options) ->
  ###
  seneca 計算用plugin
  ###
  # register rules with this keyword
  @add ptn_sum, (param, respond_cb) ->
    err = null
    ret = sum(param)
    respond_cb err, 'retVal': ret
    return

  # register rules with this keyword
  @add ptn_double, (param, respond_cb) ->
    err = null
    ret = double(param)
    respond_cb err, 'retVal': ret
    return

  # register rules with this keyword
  @add ptn_calculate, (param, respond_cb) ->
    err = null
    msg = {}
    msg.num = sum(param)
    ret = double(msg)
    respond_cb err, 'retVal': ret
    return
  return

module.exports = calc_plugin
