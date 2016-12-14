
/*
 * Calculation plugin for seneca
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
 */
var calc_plugin, double, ptn_calculate, ptn_double, ptn_sum, sum;

sum = require('./calc').sum;

double = require('./calc').double;

ptn_sum = {
  role: 'math',
  cmd: 'sum'
};

ptn_double = {
  role: 'math',
  cmd: 'double'
};

ptn_calculate = {
  role: 'math',
  cmd: 'calculate'
};

calc_plugin = function(options) {

  /*
  seneca 計算用plugin
   */
  this.add(ptn_sum, function(param, respond_cb) {
    var err, ret;
    err = null;
    ret = sum(param);
    respond_cb(err, {
      'retVal': ret
    });
  });
  this.add(ptn_double, function(param, respond_cb) {
    var err, ret;
    err = null;
    ret = double(param);
    respond_cb(err, {
      'retVal': ret
    });
  });
  this.add(ptn_calculate, function(param, respond_cb) {
    var err, msg, ret;
    err = null;
    msg = {};
    msg.num = sum(param);
    ret = double(msg);
    respond_cb(err, {
      'retVal': ret
    });
  });
};

module.exports = calc_plugin;
