//
//  1095.swift
//  DSA
//
//  Created by Rohini Vaidya on 03/08/26.
//

import Foundation

/**
 * // This is MountainArray's API interface.
 * // You should not implement it, or speculate about its implementation
 * interface MountainArray {
 *     public func get(_ index: Int) -> Int {}
 *     public func length() -> Int {}
 * }
 */

 protocol MountainArray {
      func get(_ index: Int) -> Int
      func length() -> Int
 }

class Solution1095 {
     func findInMountainArray(_ target: Int, _ mountainArr: MountainArray) -> Int {
        let peakIndex = peakIndexInMountainArray(mountainArr)
        var targetIndex = orderAgnosticBS(mountainArr, target: target, start: 0, end: peakIndex)
        if targetIndex == -1 {
             targetIndex = orderAgnosticBS(mountainArr, target: target, start: peakIndex+1, end: mountainArr.length()-1)
        }
        return targetIndex
    }

     func peakIndexInMountainArray(_ arr: MountainArray) -> Int {

        var l = 0
        var r = arr.length()-1

        while l < r {
            let mid = l + (r-l)/2

            if arr.get(mid) < arr.get(mid+1) {
                l = mid + 1
            } else {
                r = mid
            }
        }

        return l
    }

     func orderAgnosticBS(_ nums: MountainArray, target: Int, start: Int, end: Int) -> Int {
         var l = start
    var r = end

    let isAsc = nums.get(l) < nums.get(r)

    while l <= r {

        let mid = l + (r-l)/2
        let value = nums.get(mid)

        if value == target {
            return mid
        }

        if isAsc {

            if target < value {
                r = mid - 1
            } else {
                l = mid + 1
            }

        } else {

            if target > value {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
    }

    return -1
        
    }
}
