//
//  PeakIndex-852.swift
//  DSA
//
//  Created by Rohini Vaidya on 03/08/26.
//

/*
 
 https://leetcode.com/problems/peak-index-in-a-mountain-array/description/
 You are given an integer mountain array arr of length n where the values increase to a peak element and then decrease.

 Return the index of the peak element.

 Your task is to solve it in O(log(n)) time complexity.
 
 */

func peakIndexInMountainArray(_ arr: [Int]) -> Int {

        var l = 0
        var r = arr.count-1

        while l <= r {
            var mid = l + (r-l)/2

            if arr[mid] > arr[mid + 1], arr[mid] > arr[mid-1] {
                return mid
            } else if arr[mid] > arr[mid + 1] {
                r = mid
            } else if arr[mid] > arr[mid-1] {
                l = mid
            }
        }

        return -1
    }
