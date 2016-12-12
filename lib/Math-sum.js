/**
 * sum
 * @param msg.left {number}
 * @param msg.right {number}
 * @retunr total {number}
 */
var sum = function(msg){
  return parseInt(msg.left) + parseInt(msg.right);
}
module.exports = sum;

// debug
// var msg = {};
// msg.right = 12;
// msg.left =  22;
// var result = sum(msg);
// console.log(msg.right + " + " + msg.left + " = " + result);
