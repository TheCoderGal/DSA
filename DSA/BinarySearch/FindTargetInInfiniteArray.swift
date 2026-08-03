//
//  FindTargetInInfiniteArray.swift
//  DSA
//
//  Created by Rohini Vaidya on 03/08/26.
//

/*
 
 Thoughts: Since the array is infinite, but sorted, use B.S.
 But since actual start and end is unknown, lets think how we can serach.
 The way is to use the box/windows of a size and check if its present there. else move the window.
 But whats the best way to find the box/window ?
 
 To use the reverse of log N base 2. In BS, you divide array by 2 every time until you find the target, which is log n base 2.
 
 so, N/2, N/4...1 - log n steps.
 
 Now, start from 1. increment it to 2powN. log N steps again. For each window perform BS. Therfore, lets code it this way
 
 */

func inifinteArrayBS(arr: [Int], target: Int) -> Int {
    return findSolution(of: arr, target: target)
}

func findSolution(of arr: [Int], target: Int) -> Int {
    
    var start = 0
    var end = 1
    
    while target > arr[end] {
        let temp = end + 1
        end = (end-start+1) * 2
        
        start = temp
    }
    
    let ans = binarySearch(arr, target: target, start: start, end: end)
    print(ans)
    return ans
}

func binarySearch(_ nums: [Int], target: Int, start: Int, end: Int) -> Int {
    
    var r = end
    var l = start
    
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
