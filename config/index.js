var merge = require('merge');

var globalConfigFiles = [
];

var localConfigFiles = [];
try {
  localConfigFiles = require('./index.local.js');
} catch (exception) {
}

var allConfigFiles = globalConfigFiles.concat(localConfigFiles);

var config = {};
for (var i = 0; i < allConfigFiles.length; i++) {
  var configFile = allConfigFiles[i];
  config = merge.recursive(true, config, require(configFile));
}

module.exports = config;
