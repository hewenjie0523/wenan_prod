package com.wenan.mobile

import android.os.Bundle
import android.util.Log
import android.view.WindowManager
import com.android.installreferrer.api.InstallReferrerClient
import com.android.installreferrer.api.InstallReferrerStateListener
import com.android.installreferrer.api.ReferrerDetails
import com.wenan.mobile.keyboard.KBoardHeightObserver
import com.wenan.mobile.keyboard.KBoardHeightProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import net.aihelp.config.ConversationConfig
import net.aihelp.config.FaqConfig
import net.aihelp.config.UserConfig
import net.aihelp.config.enums.ConversationIntent
import net.aihelp.config.enums.ShowConversationMoment
import net.aihelp.init.AIHelpSupport
import com.wenan.mobile.common.AesHelper


class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        try {
            keyboardHeightProvider = KBoardHeightProvider(this)
            keyboardHeightProvider?.setKeyboardHeightObserver(object : KBoardHeightObserver {
                override fun onKeyboardHeightChanged(height: Int, orientation: Int) {
                    try {
                        dispatchKeyboardHeightChange(height, orientation)
                    } catch (_: Exception) {
                    }
                }
            })
            getWindow().getDecorView().post {
                keyboardHeightProvider?.start()
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        keyboardHeightProvider?.close()
    }

    var methodChannel: MethodChannel? = null

    var keyboardHeightProvider: KBoardHeightProvider? = null

    var channelName = "com.wenan.mobile.channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        methodChannel = MethodChannel(
            flutterEngine.getDartExecutor().getBinaryMessenger(),
            channelName
        )
        methodChannel?.setMethodCallHandler { call, result ->
            if (call.method.equals("$channelName.showQA")) {
                try {
                    var ucode = call.argument<String?>("$channelName.ucode")
                    var nickName = call.argument<String?>("$channelName.nickName")
                    var ai_help_domain = call.argument<String>("$channelName.qa_domain")!!
                    var ai_help_app_key = call.argument<String>("$channelName.qa_app_key")!!
                    var ai_help_app_id = call.argument<String>("$channelName.qa_app_id")!!
                    configAiHelp(ai_help_domain,ai_help_app_key,ai_help_app_id,ucode, nickName)
                    result.success("$channelName.showQA")
                } catch (e: Exception) {
                }
            } else if (call.method.equals("$channelName.upgradeInstallReferrer")){
                try {
                    updateInstallReferrer()
                } catch (e: Exception) {
                }
            } else if (call.method.equals("$channelName.switchScreenShotStatus")){
                try {
                    var aimStatus = call.argument<Int?>("$channelName.status")
                    if(aimStatus==0){
                        window.setFlags(WindowManager.LayoutParams.FLAG_SECURE, WindowManager.LayoutParams.FLAG_SECURE)
                    } else {
                        window.clearFlags(WindowManager.LayoutParams.FLAG_SECURE)
                    }
                } catch (e: Exception) {
                }
            } else if (call.method.equals("$channelName.dString")){
                try {
                    var string = call.argument<String?>("$channelName.string")
                    if(string!=null){
                        result.success(AesHelper.decryptData(string))
                    } else {
                        result.success("")
                    }
                } catch (e: Exception) {
                    e.printStackTrace()
                    result.success("")
                }
            } else if (call.method.equals("$channelName.eString")){
                try {
                    var string = call.argument<String?>("$channelName.string")
                    if(string!=null){
                        result.success(AesHelper.encryptData(string))
                    } else {
                        result.success("")
                    }
                } catch (e: Exception) {
                    e.printStackTrace()
                    result.success("")
                }
            }  else {
                result.notImplemented()
            }
        }


    }

    var aiHelpAppId:String? = null
    fun configAiHelp(ai_help_domain:String, ai_help_app_key:String, ai_help_app_id:String, ucode:String?, nickName:String?){
        if(ai_help_app_id.equals(aiHelpAppId)){
            showQASection(ucode,nickName)
            return
        }
        aiHelpAppId = ai_help_app_id
        AIHelpSupport.enableLogging(true)
        AIHelpSupport.init(
            this,
            ai_help_app_key,
            ai_help_domain,
            ai_help_app_id
        )
        AIHelpSupport.setOnAIHelpInitializedCallback {
            showQASection(ucode,nickName)
        }
    }

    private fun showQASection(ucode:String?, nickName:String?) {
        val faqConversationConfig = ConversationConfig.Builder()
            .setConversationIntent(ConversationIntent.BOT_SUPPORT)
            .setAlwaysShowHumanSupportButtonInBotPage(true)
            .build()
        FaqConfig.Builder()
            .setShowConversationMoment(ShowConversationMoment.ALWAYS)
            .setConversationConfig(faqConversationConfig)
            .build()
        AIHelpSupport.showConversation(faqConversationConfig)

        val userConfig = UserConfig.Builder()
            .setUserId(ucode)
            .setUserName(nickName)
            .build()
        AIHelpSupport.updateUserInfo(userConfig)
    }

    private var mReferrerClient: InstallReferrerClient? = null
    private fun updateInstallReferrer() {

        if(mReferrerClient == null) {
            mReferrerClient = InstallReferrerClient.newBuilder(this).build()
        }

        mReferrerClient!!.startConnection(object : InstallReferrerStateListener {
            override fun onInstallReferrerSetupFinished(responseCode: Int) {
                when (responseCode) {
                    InstallReferrerClient.InstallReferrerResponse.OK ->
                        try {
                            /**
                             * utm_source:   广告系列来源，用于确定具体的搜索引擎、简报或其他来源
                             * utm_medium:   广告系列媒介，用于确定电子邮件或采用每次点击费用 (CPC) 的广告等媒介
                             * utm_term:     广告系列字词，用于付费搜索，为广告提供关键字
                             * utm_content:  广告系列内容，用于 A/B 测试和内容定位广告，以区分指向相同网址的不同广告或链接
                             * utm_campaign: 广告系列名称，用于关键字分析，以标识具体的产品推广活动或战略广告系列
                             * gclid:        Google Ads 自动标记参数，用于衡量广告。此值会动态生成，请勿修改
                             */
                            val response: ReferrerDetails = mReferrerClient!!.installReferrer
                            // 已安装软件包的引荐来源网址
                            val installReferrer = response.installReferrer
//                            CuddySharedPreferences.setInstallReferrer(installReferrer)
                            // 引荐来源网址点击事件发生时的时间戳（以秒为单位）
                            val referrerClickTimestampSeconds =
                                response.referrerClickTimestampSeconds
//                            CuddySharedPreferences.setReferrerClickTimestampSeconds(
//                                referrerClickTimestampSeconds
//                            )
                            // 安装开始时的时间戳（以秒为单位）
                            val installBeginTimestampSeconds = response.installBeginTimestampSeconds
//                            CuddySharedPreferences.setInstallBeginTimestampSeconds(
//                                installBeginTimestampSeconds
//                            )
                            // 用于检查用户在过去 7 天内是否曾与应用的免安装体验互动
                            val instantExperienceLaunched = response.googlePlayInstantParam
//                            CuddySharedPreferences.setInstantExperienceLaunched(
//                                instantExperienceLaunched
//                            )
                            val arguments: MutableMap<String, Any> = HashMap()
                            arguments["$channelName.installReferrer"] = installReferrer
                            arguments["$channelName.referrerClickTimestampSeconds"] = referrerClickTimestampSeconds
                            arguments["$channelName.installBeginTimestampSeconds"] = installBeginTimestampSeconds
                            arguments["$channelName.instantExperienceLaunched"] = instantExperienceLaunched
                            methodChannel?.invokeMethod("$channelName.installReferrer", arguments)
                        } catch (e: Exception) {
                            e.printStackTrace()
                        }
                    InstallReferrerClient.InstallReferrerResponse.FEATURE_NOT_SUPPORTED -> {}
                    InstallReferrerClient.InstallReferrerResponse.SERVICE_UNAVAILABLE -> {}
                }
                // 断开服务连接，获取引荐来源信息后，请对 InstallReferrerClient 实例调用 endConnection() 方法来断开连接。断开连接将有助于避免出现泄露和性能问题。
                mReferrerClient?.endConnection()
            }

            override fun onInstallReferrerServiceDisconnected() {
                // Try to restart the connection on the next request to (尝试在下一个请求重新启动连接)
                // Google Play by calling the startConnection() method. (通过调用startConnection方法)
            }
        })
    }

    private var lastNotifyShowTime: Long = 0
    private var lastNotifyHideTime: Long = 0
    private val notifyInterval: Long = 500
    fun dispatchKeyboardHeightChange(height: Int, orientation: Int) {
        if (height > 0) {
            if (System.currentTimeMillis() - lastNotifyShowTime > notifyInterval) {
                val params: MutableMap<String, Any> = HashMap()
                params["$channelName.height"] = px2dip(height)
                lastNotifyShowTime = System.currentTimeMillis()
                methodChannel?.invokeMethod("$channelName.notifyKeyboardChange", params)
            }
        } else {
            if (System.currentTimeMillis() - lastNotifyHideTime > notifyInterval) {
                lastNotifyHideTime = System.currentTimeMillis()
                val params: MutableMap<String, Any> = HashMap()
                params["$channelName.height"] = 0
                methodChannel?.invokeMethod("$channelName.notifyKeyboardChange", params)
            }
        }
    }

    fun px2dip(pxValue: Int): Int {
        val scale = resources.displayMetrics.density
        return (pxValue / scale + 0.5f).toInt()
    }

}
