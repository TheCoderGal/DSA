//
//  33-RotatedBS.swift
//  DSA
//
//  Created by Rohini Vaidya on 13/08/26.
//

/*
 https://leetcode.com/problems/search-in-rotated-sorted-array/description/
 There is an integer array nums sorted in ascending order (with distinct values).

 Prior to being passed to your function, nums is possibly left rotated at an unknown index k (1 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be left rotated by 3 indices and become [4,5,6,7,0,1,2].

 Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.

 You must write an algorithm with O(log n) runtime complexity.
 
 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 
 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 */

import Foundation

class RotatedBS {
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        
        var end = nums.count - 1
        var peak = findPeakIndex(nums)
        if peak == -1 {
           return binarySearch(nums, target, 0, end)
        }
        if nums[peak] == target {
            return peak
        }
        if target >= nums[0] {
            return binarySearch(nums, target, 0, peak)
        }
        
        
        return binarySearch(nums, target, peak+1, end)
    }
    
    func findPeakIndex(_ nums: [Int]) -> Int {
        var peak = -1
        var l = 0
        var r = nums.count - 1
        
        while l <= r {
            let mid = l + (r - l) / 2
            
            if mid < r, nums[mid] > nums[mid + 1] {
                peak = mid
            }
            if mid > l, nums[mid] < nums[mid - 1] {
                peak = mid-1
            }
            if nums[mid] < nums[l] {
                r = mid-1
            } else {
                l = mid + 1
            }
        }
        
        return peak
    }
    
    func binarySearch(_ nums: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int {
        var result = -1
        var l = start
        var r = end
        while l <= r {
            let mid = l + (r - l) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        
        return result
    }
}

