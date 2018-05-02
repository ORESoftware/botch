#!/usr/bin/env node
'use strict';

import fs = require('fs');
import path  = require('path');

const pthEnv = String(process.env.PATH || '');
const paths = pthEnv.split(':');

const v = paths.filter(function (p) {
  if (p && p.match('/node_modules/.bin')) {
    
    const pre = String(p).split('/node_modules/.bin')[0];
    const botch = path.resolve(pre + '/node_modules/botch');
    
    try {
      if (fs.statSync(botch).isDirectory()) {
        return false;
      }
    }
    catch (err) {
      return true;
    }
    
  }
  return true;
});

console.log(v.join(':'));