package com.wenan.mobile.common
import java.security.KeyFactory
import java.security.PrivateKey
import java.security.PublicKey
import java.security.spec.PKCS8EncodedKeySpec
import java.security.spec.X509EncodedKeySpec
import javax.crypto.Cipher
import android.util.Base64

object RSAUtils {

    private const val RSA_ALGORITHM = "RSA"

    fun encrypt(publicKey: PublicKey, data: ByteArray): ByteArray {
        val cipher = Cipher.getInstance(RSA_ALGORITHM)
        cipher.init(Cipher.ENCRYPT_MODE, publicKey)
        return cipher.doFinal(data)
    }

    fun decrypt(privateKey: PrivateKey, encryptedData: ByteArray): ByteArray {
        val cipher = Cipher.getInstance(RSA_ALGORITHM)
        cipher.init(Cipher.DECRYPT_MODE, privateKey)
        return cipher.doFinal(encryptedData)
    }

    fun getPublicKeyFromString(encodedKey: String): PublicKey {
        val keyBytes = Base64.decode(encodedKey, Base64.DEFAULT)
        val keySpec = X509EncodedKeySpec(keyBytes)
        val keyFactory = KeyFactory.getInstance(RSA_ALGORITHM)
        return keyFactory.generatePublic(keySpec)
    }

    fun getPrivateKeyFromString(encodedKey: String): PrivateKey {
        val keyBytes = Base64.decode(encodedKey, Base64.DEFAULT)
        val keySpec = PKCS8EncodedKeySpec(keyBytes)
        val keyFactory = KeyFactory.getInstance(RSA_ALGORITHM)
        return keyFactory.generatePrivate(keySpec)
    }
}
