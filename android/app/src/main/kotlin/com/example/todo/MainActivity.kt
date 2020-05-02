package com.example.todo

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant


//import by GithubCode

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.Bundle
import android.os.Build

import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugins.common.MethodChannel
import io.flutter.view.FlutterView
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES

class MainActivity: FlutterActivity() {

    private val CHANNEL = "com.twitterconnection"

    override fun onCreate(savedInstanceState: Bundle?){
        super.onCreate(savedInstanceState);
        Log.i("user_debug", "MainActivity: onCreate")

        GeneratedPluginRegistrant.registerWith(FlutterEngine(this))


        MethodChannel(FlutterView(this), CHANNEL).setMethodCallHandler{
            methodCall, result -> when(methodCall.method.equals("tweet")){
                openTwitter()
            }else -> result.notImplemented()
        }
    }

    private fun openTwitter() {
        Intent intent = new Intent(Intent.ACTION_VIEW)
        String message = Uri.encode("This tweet is posted on Flutter app!")
        intent.setData(Uri.parse("twitter://post?message=" + message))
        startActivity(intent)
    }

}
