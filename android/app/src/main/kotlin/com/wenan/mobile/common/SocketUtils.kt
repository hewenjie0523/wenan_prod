package com.wenan.mobile.common

import java.io.BufferedReader
import java.io.InputStreamReader
import java.io.OutputStreamWriter
import java.io.PrintWriter
import java.net.Socket

object SocketUtils {

    fun sendRequest(host: String, port: Int, request: String): String {
        var response = ""
        var socket: Socket? = null
        var writer: PrintWriter? = null
        var reader: BufferedReader? = null

        try {
            // 创建Socket连接
            socket = Socket(host, port)

            // 获取输出流，用于发送请求
            writer = PrintWriter(OutputStreamWriter(socket.getOutputStream(), "UTF-8"))
            writer.println(request)
            writer.flush()

            // 获取输入流，用于接收响应
            reader = BufferedReader(InputStreamReader(socket.getInputStream(), "UTF-8"))

            // 读取响应
            val responseBuilder = StringBuilder()
            var line: String?
            while (reader.readLine().also { line = it } != null) {
                responseBuilder.append(line).append('\n')
            }
            response = responseBuilder.toString()
        } catch (e: Exception) {
            e.printStackTrace()
        } finally {
            // 关闭连接和流
            try {
                reader?.close()
                writer?.close()
                socket?.close()
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }

        return response
    }
}
