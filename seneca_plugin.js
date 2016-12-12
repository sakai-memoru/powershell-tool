/**
 *
 */
// custom module
var sum = require('./lib/math-sum')

// pattern
var ptn  = {role: 'math', cmd: 'sum'}

// register a pattern and a callback function to seneca plugin
module.exports = function sum_plugin( options ) {
    // register rules with this keyword
    this.add(ptn, function(param, respond_cb) {
      var err = null;
      var ret = sum(param);
      respond_cb(err, { 'retVal' : ret });
    })
}
