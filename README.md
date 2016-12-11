Initialize-Project.ps1
======
## Overview
Powershell scripts to create a Node.js package's folder with sample template.  

NPM用の package folder を作成して、 sample template を展開する powershell script.

## Description
* Create folders.
  + module folder
    - src  : for coffeescript
    - lib  : for javascript
    - test : for test spec
* Create files.
  + .gitignore
  + README.md
  + index.js  
* Execute blow
  + mkdir
  + git init
  + npm init
  + atom $PWD

## Usage
1. move to workspace directory.
2. copy this script to workspace directory.
3. kick this powershell script with a parameter of your package name;
```powershell
ps > ./Initialize-Project.ps1 your_package_name
```
## Author
Sakai Mitsuru

## LICENCE
In project only
