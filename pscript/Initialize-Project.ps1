<#
.DESCRIPTION
Create a environment for modules development.
.SINCE
2016/12/11
.author
sakai.mitsuru
#>

# commandline parameter
param (
  [string]$module_name = 'module_samples'
)

# set module name
mkdir $module_name
cd $module_name


# setting git repogitry
git init
'node_modules' | out-file .gitignore -encoding utf8
# setting develop folder
mkdir src
mkdir lib
mkdir test

# create index.js
$index_js = @"
var Modles = require('./lib');
module.exports = Modules;
"@
$index_js | out-file index.js -encoding utf8

# create README.md template
$readme_strings = @"
$module_name
======

## Overview

## Description

## Usage
``````javascript
var obj = require('.\lib\$module_name');
``````

## Class Design

module name

## Installation
``````
$ npm install
``````

## Dependencies
package.json
``````json
{
  "name": "$module_name",
  "version": "1.0.0",
  "description": "module description",
  "main": "index.js",
  "scripts": {
    "test": "mocha ./test/*.test.js"
  },
  "keywords": [
    "common"
  ],
  "author": "boundary.fixed",
  "license": "MIT"
}
``````
## Unit Test
``````
$ npm test
``````

## LICENCE

MIT.

"@
$readme_strings | out-file README.md -encoding utf8
