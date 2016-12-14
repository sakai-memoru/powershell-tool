
/*
 * Calculation service
* @overview　計算用library microservice
* @description
 */
var _, seneca;

_ = require('lodash');

seneca = require('seneca')();

seneca.use('seneca-calc-plugin');

seneca.listen();
