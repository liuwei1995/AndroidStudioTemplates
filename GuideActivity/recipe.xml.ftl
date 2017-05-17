<?xml version="1.0"?>
<recipe>
<#include "../common/recipe_manifest.xml.ftl" />

	<#if !appCompat && !(hasDependency('com.android.support:support-v4'))>
	        <dependency mavenUrl="com.android.support:support-v4:${buildApi}.+"/>
	    </#if>

	<#if appCompat && !(hasDependency('com.android.support:appcompat-v7'))>
	       <dependency mavenUrl="com.android.support:appcompat-v7:${buildApi}.+" />
	</#if>

	<#if (buildApi gte 22) && appCompat && !(hasDependency('com.android.support:design'))>
	    <dependency mavenUrl="com.android.support:design:${buildApi}.+" />
	</#if>

	<instantiate from="root/src/app_package/GuideActivity.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />



	<instantiate from="root/res/layout/activity_guide.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml" />

	<instantiate from="root/res/layout/view1.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/layout/view1.xml" />

 <merge from="root/res/values/strings.xml"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml" />

	<open file="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml"/>        

 	<open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
</recipe>