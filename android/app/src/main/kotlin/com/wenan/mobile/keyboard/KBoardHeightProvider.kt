package com.wenan.mobile.keyboard

import android.R
import android.app.Activity
import android.content.res.Configuration
import android.graphics.Rect
import android.graphics.drawable.ColorDrawable
import android.view.Gravity
import android.view.View
import android.view.WindowManager
import android.widget.PopupWindow

class KBoardHeightProvider(
    /**
     * The root activity that uses this KeyboardHeightProvider
     */
    private val activity: Activity
) : PopupWindow(activity) {
    /**
     * The keyboard height observer
     */
    private var observer: KBoardHeightObserver? = null

    /**
     * The cached landscape height of the keyboard
     */
    private var keyboardLandscapeHeight = 0

    /**
     * The cached portrait height of the keyboard
     */
    private var keyboardPortraitHeight = 0

    /**
     * The view that is used to calculate the keyboard height
     */
    private val popupView: View?

    /**
     * The parent view
     */
    private val parentView: View

    /**
     * Popup window itself is as big as the window of the Activity.
     * The keyboard can then be calculated by extracting the popup view bottom
     * from the activity window height.
     */
    private var maxHeight = 0
    private var lastHeight = 0

    /**
     * Construct a new KeyboardHeightProvider
     *
     * @param activity The parent activity
     */
    init {
        popupView = View(activity)
        contentView = popupView
        softInputMode =
            WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE or WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE
        inputMethodMode = INPUT_METHOD_NEEDED
        parentView = activity.findViewById(R.id.content)
        width = 0
        height = WindowManager.LayoutParams.MATCH_PARENT
        popupView.viewTreeObserver.addOnGlobalLayoutListener {
            handleOnGlobalLayout()
        }
    }

    /**
     * Start the KeyboardHeightProvider, this must be called after the onResume of the Activity.
     * PopupWindows are not allowed to be registered before the onResume has finished
     * of the Activity.
     */
    fun start() {
        parentView.post {
            if (!isShowing && parentView.windowToken != null) {
                setBackgroundDrawable(ColorDrawable(0))
                showAtLocation(parentView, Gravity.NO_GRAVITY, 0, 0)
            }
        }
    }

    /**
     * Close the keyboard height provider,
     * this provider will not be used anymore.
     */
    fun close() {
        observer = null
        dismiss()
    }

    /**
     * Set the keyboard height observer to this provider. The
     * observer will be notified when the keyboard height has changed.
     * For example when the keyboard is opened or closed.
     *
     * @param observer The observer to be added to this provider.
     */
    fun setKeyboardHeightObserver(observer: KBoardHeightObserver?) {
        this.observer = observer
    }

    private fun handleOnGlobalLayout() {
        lastHeight = popupView!!.height
        if (maxHeight < lastHeight) {
            maxHeight = lastHeight
        }
        if (maxHeight == 0) {
            return
        }
        val orientation = screenOrientation
        val keyboardHeight = maxHeight - lastHeight
        if (keyboardHeight == 0) {
            notifyKeyboardHeightChanged(0, orientation)
        } else if (orientation == Configuration.ORIENTATION_PORTRAIT) {
            keyboardPortraitHeight = keyboardHeight
            notifyKeyboardHeightChanged(keyboardPortraitHeight, orientation)
        } else {
            keyboardLandscapeHeight = keyboardHeight
            notifyKeyboardHeightChanged(keyboardLandscapeHeight, orientation)
        }

    }

    private val screenOrientation: Int
        get() = activity.resources.configuration.orientation

    private fun notifyKeyboardHeightChanged(height: Int, orientation: Int) {
        if (observer != null) {
            observer!!.onKeyboardHeightChanged(height, orientation)
        }
    }

    private fun innerGetHeight(): Int {
        val rect = Rect()
        popupView!!.getWindowVisibleDisplayFrame(rect)
        return rect.bottom - rect.top
    }
}