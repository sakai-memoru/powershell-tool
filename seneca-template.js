/**
 *
 */
var Promise = require('bluebird')
var _ = require('lodash')
var seneca = require('seneca')()
var sum = require('./lib/Math-sum')

// pattern
var ptn  = {role: 'Math', cmd: 'sum'}

// promisify
var act = Promise.promisify(seneca.act,seneca)

// add function
seneca.add({cmd: 'resolve'}, function (msg, response_cb) {
  // FIXME ptnの判定
  var err = null
  var result = sum(msg)
  response_cb(err, {'res': result})
})
// Return an error to force a rejected promise
seneca.add({cmd: 'reject'}, function (args, response_cb) {
  var err = new Error("D'oh! I've been rejected.")
  response_cb(err,{'res': 'error'});
});

// Use the new promisified act() with no callback
act({cmd: 'resolve'})
  .then(function (result) {
    // result will be {message: "Yay, I've been resolved!"} since
    // its guaranteed to resolve
  })
  .catch(function (err) {
    // Catch any error as usual if it was rejected
  });

act({cmd: 'reject'})
  .then(function (result) {
    // Never reaches here since we throw an error on purpose
  })
  .catch(function (err) {
    // err will be set with message "D'oh! I've been rejected."
  });

// // class function
// var math_sum = function(param){
//   var cmds = [];
//   var command = act(param);
//   cmds.push(command);
//   Promise.all(cmds)
//     .then(function(done){
//       return done.res;
//     })
//     .catch(function (err) {
//       console.error(err);
//     });
// }

//module.exports = math_sum;
// debug
// var arg  = {left: 10, right: 3}
// var param = _.merge(ptn,arg);
//var result = math_sum(param);


// // promisify
// function pAct(param){
//   var promise = new Promise(
//     function(resolve,reject){
//       seneca.act(param, function(err,done){
//         seneca.result = done.res
//         console.log('log in pAct: ' + seneca.result);
//         return seneca.result
//       })
//     }
//   );
//   return promise
// }
//
// var math_sum = function(param){
//   co(function *(){
//     var result;
//     yield result = pAct(param);
//     yield console.log(result);
//   })
// }
