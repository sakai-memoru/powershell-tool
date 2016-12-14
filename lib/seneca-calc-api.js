var seneca_calc_api;

seneca_calc_api = function(options) {
  var ptn, valid_ops;
  valid_ops = {
    sum: 'sum',
    calculate: 'calculate'
  };
  ptn = {
    role: 'api',
    path: 'calculate'
  };
  this.add(ptn, function(msg, respond) {
    var left, operation, param, right;
    operation = msg.args.params.operation;
    left = msg.args.query.left;
    right = msg.args.query.right;
    param = {
      role: 'math',
      cmd: valid_ops[operation],
      left: left,
      right: right
    };
    this.act(param, respond);
  });
  this.add('init:api', function(msg, respond) {
    var param_init;
    param_init = {
      role: 'web',
      routes: {
        prefix: '/api',
        pin: 'role:api,path:*',
        map: {
          calculate: {
            GET: true,
            suffix: '/:operation'
          }
        }
      }
    };
    this.act(param_init, respond);
  });
};

module.exports = seneca_calc_api;
