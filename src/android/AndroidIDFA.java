package com.praves.cordova.android.idfa;

//Cordova imports
import org.apache.cordova.CordovaInterface; 
import org.apache.cordova.CallbackContext; 
import org.apache.cordova.CordovaPlugin; 
import org.apache.cordova.CordovaWebView;

//Android imports
import android.content.Context;
import android.app.Application;
import android.app.Activity;
//import android.telephony.TelephonyManager;
import android.util.Log;

//JSON Imports
import org.json.JSONArray; 
import org.json.JSONObject;
import org.json.JSONException;

//Java Imports
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Iterator;

////PG Class Imports
//import com.personagraph.api.PGAgent;
//import com.personagraph.api.PGSensorState;
//import com.personagraph.api.PGSettings;
//import com.personagraph.api.PGUserProfileCallback;
//import com.personagraph.api.PGSourceType;

//pgcore import
import com.praves.cordova.android.idfa.CoreException;

public class AndroidIDFA extends CordovaPlugin {

    Context context;
    Application app;   
    boolean enableLog;
    Activity activity;
    public static final String TAG = "AndroidIDFA";

    //Constructor function.
    public void initialize(CordovaInterface cordova, CordovaWebView webView) { 
        super.initialize(cordova, webView);
        context = this.cordova.getActivity().getApplicationContext();
        app = this.cordova.getActivity().getApplication(); 
        activity = this.cordova.getActivity();
        enableLog =  false; 
    }

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException { 
        try {
            if ("getAdInfo".equals(action)) {
                getAdInfo(callbackContext);
            } else if ("getAdId".equals(action)) {
               getAdId(callbackContext);
           } else if ("getLimitAd".equals(action)) {
              getLimitAd(callbackContext);
          }

            return true;
        }catch (Exception e){
            if(enableLog){
                e.printStackTrace();
                System.err.println("AndroidIDFA execute Exception: " + e.getMessage());
            }
            callbackContext.error(e.getMessage());
            return false;
        }
    }

    @Override
    public void onPause(boolean multitasking) {

        if(enableLog)
            Log.d(TAG, "Activity on pause is called");

        super.onPause(multitasking);
    }

    @Override
    public void onResume(boolean multitasking) {

        if(enableLog)
            Log.d(TAG, "Activity on resume is called");

        super.onResume(multitasking);
    }

    private void _getAdInfo(final CallbackContext callbackContext, final int flag) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    AdvertisingIdClient.AdInfo adInfo = AdvertisingIdClient.getAdvertisingIdInfo(context);
                    String advertisingId = adInfo.getId();
                    boolean optOutEnabled = adInfo.isLimitAdTrackingEnabled();

                    JSONObject result = new JSONObject();

                    switch(flag) {

                        case 1:
                            result.put("adId", advertisingId);
                            break;
                        case 2:

                            result.put("limitAd", optOutEnabled);
                            break;

                        case 0:
                        default:

                            result.put("adId", advertisingId);
                            result.put("limitAd", optOutEnabled);
                            break;
                    }
                    callbackContext.success(result);
                } catch (Exception e) {
                    callbackContext.error(e.getMessage());
                    e.printStackTrace();
                }
            }
        }).start();
    }

    public void getAdInfo(final CallbackContext callbackContext) {
        final int flag = 0;
        _getAdInfo(callbackContext, flag);
    }

    public void getAdId(final CallbackContext callbackContext) {
        final int flag = 1;
        _getAdInfo(callbackContext, flag);
    }

    public void getLimitAd(final CallbackContext callbackContext) {
        final int flag = 2;
        _getAdInfo(callbackContext, flag);
    }

}