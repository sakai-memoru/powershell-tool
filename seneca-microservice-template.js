var _ = require('lodash')
var seneca = require('seneca')()
seneca.use('seneca_plugin')
//seneca.listen();

// debug
var ptn  = {role: 'math', cmd: 'sum'}
var arg  = {left: 10, right: 12}
var param = _.merge(ptn,arg);
seneca.act(param,console.log)
