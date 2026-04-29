package com.wenan.mobile.common

object SortingUtils {

    // 冒泡排序
    fun bubbleSort(arr: IntArray) {
        val n = arr.size
        var swapped: Boolean
        do {
            swapped = false
            for (i in 1 until n) {
                if (arr[i - 1] > arr[i]) {
                    val temp = arr[i - 1]
                    arr[i - 1] = arr[i]
                    arr[i] = temp
                    swapped = true
                }
            }
        } while (swapped)
    }

    // 选择排序
    fun selectionSort(arr: IntArray) {
        val n = arr.size
        for (i in 0 until n - 1) {
            var minIndex = i
            for (j in i + 1 until n) {
                if (arr[j] < arr[minIndex]) {
                    minIndex = j
                }
            }
            if (minIndex != i) {
                val temp = arr[i]
                arr[i] = arr[minIndex]
                arr[minIndex] = temp
            }
        }
    }

    // 插入排序
    fun insertionSort(arr: IntArray) {
        val n = arr.size
        for (i in 1 until n) {
            val key = arr[i]
            var j = i - 1
            while (j >= 0 && arr[j] > key) {
                arr[j + 1] = arr[j]
                j--
            }
            arr[j + 1] = key
        }
    }

    // 快速排序
    fun quickSort(arr: IntArray, low: Int, high: Int) {
        if (low < high) {
            val pivotIndex = partition(arr, low, high)
            quickSort(arr, low, pivotIndex - 1)
            quickSort(arr, pivotIndex + 1, high)
        }
    }

    private fun partition(arr: IntArray, low: Int, high: Int): Int {
        val pivot = arr[high]
        var i = low - 1
        for (j in low until high) {
            if (arr[j] < pivot) {
                i++
                val temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp
            }
        }
        val temp = arr[i + 1]
        arr[i + 1] = arr[high]
        arr[high] = temp
        return i + 1
    }
}
