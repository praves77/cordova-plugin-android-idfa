# cordova-plugin-android-idfa
Phonegap, Cordova, Intel XDK plugin for Android to get Advertising Id Info

Advertising ID (IDFA) Plugin for Android using Google Play Services

This plugin depends on [com.google.play.services](http://plugins.cordova.io/#/package/com.google.play.services).
Cordova (PhoneGap) 3.0+ Plugin to get Adertising ID (IDFA) on Adnroid device using Google Play Sercies API.
Obtains [advertising id (IDFA) info](https://support.google.com/googleplay/android-developer/answer/6048248?hl=en).

**iOS CAUTION:** This plugin is for Android Platform only.

Prerequisites:
* A Cordova 3.0+ project for Android
* Google Play Services API 

---
## Platform SDK supported ##

* Android, using Google Play Services for Android

---
## Quick start ##

To install this plugin, follow the [Command-line Interface Guide](http://cordova.apache.org/docs/en/edge/guide_cli_index.md.html#The%20Command-line%20Interface). You can use one of the following command lines:

* `cordova plugin add cordova-plugin-android-idfa`
* `cordova plugin add https://github.com/praves77/cordova-plugin-android-idfa.git`

Make sure to review the Google Play Developer Program [policy](https://play.google.com/about/developer-content-policy.html#ADID) and [terms](https://play.google.com/about/developer-distribution-agreement.html#use)

---
## Javascript API ##

*Note:* All success callbacks are in the form `'function () {}'`, and all failure callbacks are in the form `'function (err) {}'` where `err` is a String explaining the error reason.


### Advertising id info ###
#### getAdInfo(success, error);
Gets the advertising id (IDFA) info (id and limit ad flag).

* {function()} success:    success callback with {idfa: <advertising id (IDFA)>, isLimitAd: <boolean> object argument.
* {function()} failure:    failure callback.

### Advertising id ###
#### getAdId(success, error);
Gets the advertising id (IDFA).

* {function()} success:    success callback with <advertising id (IDFA)> string argument.
* {function()} failure:    failure callback.

### Limit Ad Flag ###
#### getLimitAdFlag(success, error);
Gets the limit add flag.

* {function()} success:    success callback with isLimitAd flag boolean argument.
* {function()} failure:    failure callback.
