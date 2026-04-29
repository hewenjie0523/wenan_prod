package com.wenan.mobile.common

import android.util.Patterns

object StringExtensions {

    fun String?.isEmptyOrNull(): Boolean {
        return this == null || this.trim().isEmpty()
    }

    fun String.isValidEmail(): Boolean {
        return Patterns.EMAIL_ADDRESS.matcher(this).matches()
    }

    fun String.isPhoneNumber(): Boolean {
        return Patterns.PHONE.matcher(this).matches()
    }

    fun String.isAlphanumeric(): Boolean {
        return this.matches("[a-zA-Z0-9]+".toRegex())
    }

    fun String.capitalizeWords(): String {
        return this.split(" ").joinToString(" ") { it.capitalize() }
    }

    fun String.stripHtmlTags(): String {
        return this.replace(Regex("<[^>]*>"), "")
    }

    fun String.containsIgnoreCase(other: String): Boolean {
        return this.lowercase().contains(other.lowercase())
    }

    fun String.extractDigits(): String {
        return this.replace("\\D+".toRegex(), "")
    }

    fun String.limitTo(maxLength: Int): String {
        return if (length > maxLength) substring(0, maxLength) else this
    }

    fun String.isPalindrome(): Boolean {
        val cleanString = this.replace("[^a-zA-Z0-9]".toRegex(), "").lowercase()
        return cleanString == cleanString.reversed()
    }

    fun String.toCamelCase(): String {
        return this.split(" ").joinToString("") { it.capitalize() }
    }

    fun String.abbreviate(maxLength: Int): String {
        return if (length > maxLength) substring(0, maxLength - 3) + "..." else this
    }

    fun String.removeWhitespace(): String {
        return this.replace("\\s".toRegex(), "")
    }

    fun String.extractUrls(): List<String> {
        return "\\bhttps?://\\S+\\b".toRegex().findAll(this).map { it.value }.toList()
    }

    fun String.isNumeric(): Boolean {
        return this.matches("-?\\d+(\\.\\d+)?".toRegex())
    }

    fun String.repeatString(times: Int): String {
        return this.repeat(times)
    }

    fun String.escapeHtml(): String {
        return this.replace("&", "&amp;")
            .replace("<", "&lt;")
            .replace(">", "&gt;")
            .replace("\"", "&quot;")
            .replace("'", "&#39;")
    }

    fun String.truncate(maxLength: Int): String {
        return if (length > maxLength) substring(0, maxLength) else this
    }

    fun String.isUpperCase(): Boolean {
        return this == this.uppercase()
    }

    fun String.isLowerCase(): Boolean {
        return this == this.lowercase()
    }
}
