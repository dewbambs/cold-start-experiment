package com.companyx.cold_start

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.FlutterInjector
import io.flutter.embedding.engine.dynamicfeatures.PlayStoreDeferredComponentManager

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        val deferredComponentManager = PlayStoreDeferredComponentManager(this, null)
        FlutterInjector.setInstance(
            FlutterInjector.Builder()
                .setDeferredComponentManager(deferredComponentManager)
                .build()
        )
        super.onCreate(savedInstanceState)
    }
}
