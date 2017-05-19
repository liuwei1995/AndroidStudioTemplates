<manifest xmlns:android="http://schemas.android.com/apk/res/android" >

    <application>
     <!-- 钉钉抢红包 -->
        <service
            android:name="${relativePackage}.${className}"
            android:label="钉钉抢红包"
            android:exported="false"
            android:permission="android.permission.BIND_ACCESSIBILITY_SERVICE">
            >
            <intent-filter>
                <action android:name="android.accessibilityservice.AccessibilityService"/>
            </intent-filter>

            <meta-data
                android:name="android.accessibilityservice"
                android:resource="@xml/my_accessibilityservice"/>
        </service>

    </application>

</manifest>
