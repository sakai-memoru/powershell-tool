npm install --save seneca
npm install --save lodash

$seneca_template = @"
/**
 *
 */
var _ = require('lodash')
var seneca = require('seneca')()
var sum =require('./lib/Math-sum')
//seneca.use('./lib/sum.js');

var ptn  = {role: 'Math', cmd: 'sum'}
seneca.add(ptn, function (msg, response_cb) {
  var err = null
  var result = sum(msg)
  response_cb(err, {'res': result})
})


// debug
var arg  = {left: 1, right: 3}
var param = _.merge(ptn,arg);
seneca.act(param, function(err,done){
  console.log('result = ' + done.res)
})
"@

$seneca_template | out-file './seneca-template.js' -encoding utf8

$lib_math_sum = @"
var sum = function(msg){
  return msg.left + msg.right;
}
module.exports = sum;

// // debug
// var msg = {};
// msg.right = 12;
// msg.left =  22;
// var result = sum(msg);
// console.log(result);

"@

out-file './lib/Math-sum.js' -encoding utf8

npm init
