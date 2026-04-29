package com.wenan.mobile.common
import android.net.Uri

object UrlUtils {

    // 合并URL
    fun joinUrl(baseUrl: String, relativeUrl: String): String {
        val baseUri = Uri.parse(baseUrl)
        val relativeUri = Uri.parse(relativeUrl)
        val joinedUri = baseUri.buildUpon().appendPath(relativeUri.toString()).build()
        return joinedUri.toString()
    }

    // 获取URL中的参数值
    fun getParameterValue(url: String, paramName: String): String? {
        val uri = Uri.parse(url)
        return uri.getQueryParameter(paramName)
    }

    // 移除URL中的参数
    fun removeParameter(url: String, paramName: String): String {
        val uri = Uri.parse(url)
        val builder = uri.buildUpon()
        builder.clearQuery()
        val queryParameterNames = uri.queryParameterNames
        for (name in queryParameterNames) {
            if (name != paramName) {
                builder.appendQueryParameter(name, uri.getQueryParameter(name))
            }
        }
        return builder.build().toString()
    }
}
