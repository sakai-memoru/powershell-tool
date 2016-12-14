
/*
 * Calculation library
* @overview　計算用library modules
* @description
 */
var double, sum;

double = function(msg) {

  /*
   * double number
  * 数字を２倍にする
  *  @param msg {} message object
  *  @param msg.num {number} 対象の数値
  *  @return {number} ２倍になった数値
   */
  return parseInt(msg.num) * 2;
};

sum = function(msg) {

  /*
   * sum
  * ２つの数字を合計する
  * @param msg.left {number}
  * @param msg.right {number}
  * @return total {number}
   */
  return parseInt(msg.left) + parseInt(msg.right);
};

module.exports.sum = sum;

module.exports.double = double;
