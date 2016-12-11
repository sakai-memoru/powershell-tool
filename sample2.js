var seneca = require('seneca')();
// add registers a new service
seneca.add({
  feature: 'math',
  service: 'sum'
}, function (msg, respond_cb) {
  var err = null;
  respond_cb(err, { sum: msg.a + msg. b });
})
.listen()
;
// seneca.act asks any microservice that implements
// { feature: 'math', serice: 'sum' }
// to execute and return results
seneca.act({
  feature: 'math',
  service: 'sum',
  a: 2,
  b: 3
}, function (err, res) {
  if (err) { throw err; }
  console.log('2 + 3 = %d', res.sum);
});
