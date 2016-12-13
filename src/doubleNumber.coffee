# out: ../lib/$1.js
###
# double
# @param msg.num {number}
# @return calculated {number}
###

double = (msg) ->
  parseInt(msg.num)*2

module.exports = double

# # debug
# msg = {};
# msg.num = 12;
# result = double(msg);
# console.log(msg.num + " * 2 " + " = " + result);
