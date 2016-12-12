/**
 *
 */
var _ = require('lodash')
var seneca = require('seneca')()
// custom module
var sum = require('./lib/math-sum')

// pattern
var ptn  = {role: 'math', cmd: 'sum'}

// register a pattern and a callback function to seneca object
seneca.add(ptn, function (param, respond_cb) {
  var err = null;
  var ret = sum(param);
  respond_cb(err, { 'retVal' : ret });
})

// // listen on microservice
// seneca.listen()

// debug
var arg  = {left: 10, right: 12}
var param = _.merge(ptn,arg);
math_sum(param);

function math_sum(options){
  // act a seneca's function
  seneca.act(param,function(err,result){
    if (err) return console.error(err)
    console.log(result);
  })
}
