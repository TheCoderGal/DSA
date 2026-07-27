//
//  Algorithm.swift
//  DSA
//
//  Created by Rohini Vaidya on 23/07/26.
//

/*
 
 REQUIREMENT:  SORTED ARRAY
 
 */
class SolutionSimpleBS {
    
    func binarySearch(_ nums: [Int], target: Int) -> Int {
        
        var r = nums.count - 1
        var l = 0
        
        while l<=r {
            
            var mid = l + (r-l)/2
            if target < nums[mid] {
                r = mid-1
            } else if target > nums[mid] {
                l = mid+1
            } else {
                return mid
            }
        }
        
        return -1
    }
    
    func orderAgnosticBS(_ nums: [Int], target: Int) -> Int {
        var r = nums.count - 1
        var l = 0
        
        var isAsc = false
        
        if nums[l] < nums[r] {
            isAsc = true
        }
        while l < r {
            var mid = l + (r-l)/2

            if nums[mid] == target {
                return mid
            } else {
                if isAsc {
                    if target < nums[mid] {
                        r = mid-1
                    } else {
                        l = mid+1
                    }
                } else {
                    if target > nums[mid] {
                        r = mid-1
                    } else {
                        l = mid+1
                    }
                }
            }
        }
        return -1
        
    }
    
}
