package com.wenan.mobile.common


import java.security.MessageDigest
import javax.crypto.Cipher
import javax.crypto.spec.SecretKeySpec


/**
 * lixingyu 2022-06-10
 */
object AesHelper {
    /**
     */
    private const val ALGORITHM = "AES"

//    private const val SECKEY = "123" //"cBMW5X4wd9MHZhUoot7wnhYJ"
    private const val SECKEY = "cBMW5X4wd9MHZhUoot7wnhYJ" //"123"

    /**
     */
    private const val ALGORITHM_MODE_PADDING = "AES/ECB/PKCS7Padding"

//    private val cipher = Cipher.getInstance(ALGORITHM_MODE_PADDING).apply {
//        init(Cipher.DECRYPT_MODE, SecretKeySpec(getMD5String(SECKEY).toByteArray(charset("UTF-8")), ALGORITHM))
//    }

    /**
     *
     * @param base64Data
     * @return
     * @throws Exception
     */
    fun decryptData(base64Data: String): String {
        val cipher = Cipher.getInstance(ALGORITHM_MODE_PADDING).apply {
            init(Cipher.DECRYPT_MODE, SecretKeySpec(getMD5String(SECKEY).toByteArray(charset("UTF-8")), ALGORITHM))
        }
        return String(cipher.doFinal(android.util.Base64.decode(base64Data,android.util.Base64.DEFAULT)))
    }

    fun encryptData(base64Data: String?): String {
        var cipher = Cipher.getInstance(ALGORITHM_MODE_PADDING).apply {
            init(Cipher.ENCRYPT_MODE, SecretKeySpec(getMD5String(SECKEY).toByteArray(charset("UTF-8")), ALGORITHM))
        }
        return android.util.Base64.encodeToString(cipher.doFinal(base64Data?.toByteArray()),android.util.Base64.DEFAULT)
    }

    private fun getMD5String(str: String): String{
        return try {
            val hash = MessageDigest.getInstance("MD5").digest(str.toByteArray(charset("UTF-8")))
            val hex = java.lang.StringBuilder(hash.size * 2)
            for (b in hash) {
                if (b.toInt() and 0xFF < 0x10) {
                    hex.append("0")
                }
                hex.append(Integer.toHexString(b.toInt() and 0xFF))
            }
            hex.toString()
        } catch (e: java.lang.Exception) {
            e.printStackTrace()
            ""
        }
    }
}

