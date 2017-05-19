<?xml version="1.0"?>
<recipe>
    <merge from="root/AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    <merge from="root/res/values/strings.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/res/values/strings.xml" />

    <instantiate from="root/res/xml/my_accessibilityservice.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/res/xml/${accessibilityServiceXmlName}.xml" />

    <instantiate from="root/src/app_package/MyAccessibilityService.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${className}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${className}.java" />
</recipe>
