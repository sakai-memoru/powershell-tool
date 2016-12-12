// var seneca = require('seneca')();

module.exports = function( options ) {
  var seneca = this;

  seneca.add( { role:'process', cmd:'sum' }, sum );
    done( null, { result: result } );
  }

}

function sum ( args, done ) {
  var numbers = args.numbers;
  var result = numbers.reduce( function( a, b ) {
    return a + b;
  }, 0);


// debug
seneca.act({role :'process',cmd:'sum',numbers:[1,2,3]},function(err,result){
  console.log(result);
})
