    var cordova = require('cordova');
    var androidIDFA = {

        pluginVersion : "1.0.1", //TODO Need to read from plugin.xml file. this value should be in sync plugin.xml value

        /**
         * Function to get version of the plugin.
         * @param successCallback
         * @param errorCallback
         */
        getPluginVersion : function(successCallback, errorCallback){
            successCallback(this.pluginVersion);
        },

        /**
         * Function to get advertiser id info (id and isLimit advertising flag) on success. On error, it returns error object/string.
         * successCallback function returns advertiser info as object {adId: <adervtiser-id>, limitAd: <boolean> }
         * @param successCallback
         * @param errorCallback
         */
        getAdInfo : function(successCallback, errorCallback){
            cordova.exec(successCallback, errorCallback, 'AndroidIDFA', 'getAdInfo', []);
        },

        /**
         * Function to get advertiser id on success. On error, it returns error object/string.
         * successCallback function returns advertiser info as object {adId: <adervtiser-id> }
         * @param successCallback
         * @param errorCallback
         */
        getAdId : function(successCallback, errorCallback){
            cordova.exec(successCallback, errorCallback, 'AndroidIDFA', 'getAdId', []);
        },

        /**
         * Function to get isLimit advertising flag on success. On error, it returns error object/string.
         * successCallback function returns isLimit ad flag info as object { limitAd: <boolean> }
         * @param successCallback
         * @param errorCallback
         */
        getLimitAd : function(successCallback, errorCallback){
            cordova.exec(successCallback, errorCallback, 'AndroidIDFA', 'getLimitAd', []);
        }

    };

    module.exports = androidIDFA;

