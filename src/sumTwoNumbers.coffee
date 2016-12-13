# out: ../lib/$1.js
###
# sum
# @param msg.left {number}
# @param msg.right {number}
# @return total {number}
###

sum = (msg) ->
  parseInt(msg.left) + parseInt(msg.right)

module.exports = sum
# # debug
# msg = {};
# msg.right = 12;
# msg.left =  22;
# result = sum(msg);
# console.log(msg.right + " + " + msg.left + " = " + result);
