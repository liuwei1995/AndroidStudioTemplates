<manifest xmlns:android="http://schemas.android.com/apk/res/android" >

    <application>
        <service
            android:name="${relativePackage}.${className}"

             <#if accessibilityServiceLabelName == "">
                 android:label="accessibilityService 服务"
            <#else>
                 android:label="${accessibilityServiceLabelName}"
            </#if>
            android:exported="false"
            android:permission="android.permission.BIND_ACCESSIBILITY_SERVICE">
            >
            <intent-filter>
                <action android:name="android.accessibilityservice.AccessibilityService"/>
            </intent-filter>

            <meta-data
                android:name="android.accessibilityservice"
                android:resource="@xml/${accessibilityServiceXmlName}"/>
        </service>

    </application>

</manifest>
