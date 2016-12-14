###
# Calculation library
* @overview　計算用library modules
* @description
###

double = (msg) ->
  ###
  # double number
  * 数字を２倍にする
  *  @param msg {} message object
  *  @param msg.num {number} 対象の数値
  *  @return {number} ２倍になった数値
  ###
  parseInt(msg.num)*2

sum = (msg) ->
  ###
  # sum
  * ２つの数字を合計する
  * @param msg.left {number}
  * @param msg.right {number}
  * @return total {number}
  ###
  parseInt(msg.left) + parseInt(msg.right)

module.exports.sum = sum

module.exports.double = double

# # debug
# msg = {};
# msg.num = 12;
# result = double(msg);
# console.log(msg.num + " * 2 " + " = " + result);

# # debug
# msg = {};
# msg.right = 12;
# msg.left =  22;
# result = sum(msg);
# console.log(msg.right + " + " + msg.left + " = " + result);
