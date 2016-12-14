
seneca_calc_api = (options) ->
  # validate cmd
  valid_ops =
    sum: 'sum'
    calculate : 'calculate'

  # action pattern
  ptn =
    role: 'api'
    path: 'calculate'

  @add ptn, (msg, respond) ->
    operation = msg.args.params.operation
    left = msg.args.query.left
    right = msg.args.query.right
    param = {
      role: 'math'
      cmd: valid_ops[operation]
      left: left
      right: right
    }
    @act param, respond
    return

  @add 'init:api', (msg, respond) ->
    param_init = {
      role: 'web'
      routes:
        prefix: '/api'
        pin: 'role:api,path:*'
        map: calculate:
          GET: true
          suffix: '/:operation'
    }
    @act param_init , respond
    return
  return

module.exports = seneca_calc_api
