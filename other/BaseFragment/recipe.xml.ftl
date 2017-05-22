<?xml version="1.0"?>
<recipe>

    <#if isGeneric>

        <instantiate from="root/src/app_package/BaseFragmentE.java.ftl"
                           to="${escapeXmlAttribute(srcOut)}/${fragmentClass}.java" />

        <instantiate from="root/src/app_package/presenter/FragmentPresenter.java.ftl"
                           to="${escapeXmlAttribute(srcOut)}/presenter/${presenterName}.java" />

        <instantiate from="root/src/app_package/iview/FragmentIView.java.ftl"
                           to="${escapeXmlAttribute(srcOut)}/iview/${IViewName}.java" />

    <#else>

        <instantiate from="root/src/app_package/BaseFragment.java.ftl"
                              to="${escapeXmlAttribute(srcOut)}/${fragmentClass}.java" />

    </#if>

    <open file="${escapeXmlAttribute(srcOut)}/${fragmentClass}.java" />

</recipe>
