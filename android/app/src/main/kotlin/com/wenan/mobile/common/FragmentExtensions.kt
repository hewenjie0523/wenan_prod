package com.wenan.mobile.common

import android.os.Bundle
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager

object FragmentExtensions {

    fun FragmentManager.replaceFragment(containerId: Int, fragment: Fragment, addToBackStack: Boolean = false) {
        val transaction = beginTransaction()
        transaction.replace(containerId, fragment)
        if (addToBackStack) {
            transaction.addToBackStack(null)
        }
        transaction.commit()
    }

    fun FragmentManager.clearBackStack() {
        popBackStack(null, FragmentManager.POP_BACK_STACK_INCLUSIVE)
    }

    fun Fragment.arguments(init: Bundle.() -> Unit): Fragment {
        val bundle = Bundle()
        bundle.init()
        arguments = bundle
        return this
    }

    fun Fragment.getStringArgument(key: String): String {
        return arguments?.getString(key) ?: ""
    }

    fun Fragment.getIntArgument(key: String, defaultValue: Int = 0): Int {
        return arguments?.getInt(key, defaultValue) ?: defaultValue
    }

    fun Fragment.getBooleanArgument(key: String, defaultValue: Boolean = false): Boolean {
        return arguments?.getBoolean(key, defaultValue) ?: defaultValue
    }

    fun Fragment.showToast(message: String, duration: Int = android.widget.Toast.LENGTH_SHORT) {
        android.widget.Toast.makeText(requireContext(), message, duration).show()
    }

    fun Fragment.showAlertDialog(
        title: String? = null,
        message: String? = null,
        positiveButtonTitle: String = "OK",
        positiveButtonClick: () -> Unit = {},
        negativeButtonTitle: String? = null,
        negativeButtonClick: () -> Unit = {}
    ) {
        val builder = android.app.AlertDialog.Builder(requireContext())
        builder.setTitle(title)
            .setMessage(message)
            .setPositiveButton(positiveButtonTitle) { _, _ -> positiveButtonClick() }
        negativeButtonTitle?.let {
            builder.setNegativeButton(negativeButtonTitle) { _, _ -> negativeButtonClick() }
        }
        builder.create().show()
    }

    fun Fragment.runOnUiThread(action: () -> Unit) {
        requireActivity().runOnUiThread(action)
    }

    fun Fragment.popBackStack() {
        requireActivity().onBackPressed()
    }

    fun Fragment.hideKeyboard() {
        val inputMethodManager = requireContext().getSystemService(android.content.Context.INPUT_METHOD_SERVICE) as android.view.inputmethod.InputMethodManager
        inputMethodManager.hideSoftInputFromWindow(view?.windowToken, 0)
    }

    fun Fragment.showKeyboard() {
        val inputMethodManager = requireContext().getSystemService(android.content.Context.INPUT_METHOD_SERVICE) as android.view.inputmethod.InputMethodManager
        inputMethodManager.showSoftInput(view, android.view.inputmethod.InputMethodManager.SHOW_IMPLICIT)
    }

    fun Fragment.openUrlInBrowser(url: String) {
        val intent = android.content.Intent(android.content.Intent.ACTION_VIEW, android.net.Uri.parse(url))
        startActivity(intent)
    }

    fun Fragment.shareText(text: String, title: String = "Share via") {
        val intent = android.content.Intent(android.content.Intent.ACTION_SEND)
        intent.type = "text/plain"
        intent.putExtra(android.content.Intent.EXTRA_TEXT, text)
        startActivity(android.content.Intent.createChooser(intent, title))
    }

    fun Fragment.navigateToSettings() {
        val intent = android.content.Intent(android.provider.Settings.ACTION_SETTINGS)
        startActivity(intent)
    }

    fun Fragment.navigateToAppSettings() {
        val intent = android.content.Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
        intent.data = android.net.Uri.fromParts("package", requireContext().packageName, null)
        startActivity(intent)
    }

    fun Fragment.requestPermissions(permissions: Array<String>, requestCode: Int) {
        requestPermissions(permissions, requestCode)
    }
}
