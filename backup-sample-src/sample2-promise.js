var seneca = require('seneca')();
var Promise = require('bluebird');
seneca.actAsync = Promise.promisify(seneca.act, seneca);
seneca.actAsync({
  feature: 'math',
  service: 'sum',
  a: 2,
  b: 3
}).then(function (data) {
  console.log('2 + 3 = %d', data.sum);
});
