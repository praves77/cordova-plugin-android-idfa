    var cordova = require('cordova');
    var androidIDFA = {

        pluginVersion : "1.0.1", //TODO Need to read from plugin.xml file. this value should be in sync plugin.xml value

        getPluginVersion : function(successCallback, errorCallback){
            successCallback(this.pluginVersion);
        },

        getAdInfo : function(successCallback, errorCallback){
            cordova.exec(successCallback, errorCallback, 'AndroidIDFA', 'getAdInfo', []);
        },

        getAdId : function(successCallback, errorCallback){
            cordova.exec(successCallback, errorCallback, 'AndroidIDFA', 'getAdId', []);
        },

        getLimitAd : function(successCallback, errorCallback){
            cordova.exec(successCallback, errorCallback, 'AndroidIDFA', 'getLimitAd', []);
        }

    };

    module.exports = androidIDFA;

