//
//  Floor.swift
//  DSA
//
//  Created by Rohini Vaidya on 27/07/26.
//

//Smallest no <= target.
//at the breaking point l > r or l = r+1, hence r < l and hence return r
func findFloor(_ arr: [Int], target: Int) -> Int {
    var l = 0
    var r = arr.count - 1
    
    var isAsc = false
    
    if arr[l] < arr[r] {
        isAsc = true
    }
    
    //at the end of the while loop l > r
    //hence if the match is not found, return l
    while l <= r {
        var m = l + (r-l)/2
        if isAsc {
            if target > arr[m] {
                l = m + 1
            } else if target < arr[m] {
                r = m - 1
            } else {
                return m
            }
        } else {
            if target < arr[m] {
                l = m + 1
            } else if target > arr[m] {
                r = m - 1
            }
            else {
                return m
            }
        }

    }
    return r
}
