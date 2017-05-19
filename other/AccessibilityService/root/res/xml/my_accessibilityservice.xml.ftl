<?xml version="1.0" encoding="utf-8"?>
<accessibility-service xmlns:android="http://schemas.android.com/apk/res/android"
                       android:accessibilityEventTypes="typeWindowStateChanged|typeWindowContentChanged|typeWindowsChanged|typeNotificationStateChanged|typeViewScrolled|typeGestureDetectionEnd|typeTouchInteractionStart"
                       android:accessibilityFeedbackType="feedbackAllMask"
                       android:accessibilityFlags="flagDefault"
                       android:canRetrieveWindowContent="true"
                       <#if isDescription>
                       android:description="@string/${accessibilityServiceDescriptionName}"
                       <#else>
                       android:description="@string/my_AccessibilityService"
                       </#if>
                       android:notificationTimeout="100"
                        <#if listeningPackageName == "">
                             android:packageNames="${relativePackage}"
                         <#else>
                              android:packageNames="${listeningPackageName}"
                         </#if>
    >
	<!--  packageNames listeningPackageName 改为需要监听的包名 -->
	
    <!-- android:settingsActivity="foo.bar.TestBackActivity"-->
    <!-- android:canRequestTouchExplorationMode="true"-->
    <!--android:accessibilityEventTypes="typeWindowStateChanged|typeWindowContentChanged|typeWindowsChanged|typeNotificationStateChanged|typeViewScrolled"-->

</accessibility-service>