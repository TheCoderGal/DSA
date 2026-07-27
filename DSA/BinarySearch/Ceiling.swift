//
//  CeilingOfANuo.swift
//  DSA
//
//  Created by Rohini Vaidya on 25/07/26.
//
/*
 
 Given an array of nums, find the ceiling of a target no.
 //ASC
 Ex: Arr = [1,2,3,4,6,8]
 target: 3, ans: 2
 target: 5, ans 4
 target 9: and and 6
 
 //DESC
 Ex: Arr = [8, 5, 3, 2]
 target: 3, ans: 2
 target: 6, ans 0
 target 9: and and 6
 
 So find no >= target
 */


class SolutionCeilingOfNo {
    
    //Smallest no >= target
    func findCeilingOfANo(_ arr: [Int], target: Int) -> Int {
        var l = 0
        var r = arr.count - 1
        
        var isAsc = false
        
        if arr[l] < arr[r] {
            isAsc = true
        }
        
        if isAsc {
            if target > arr[r] {
                return -1
            }
        } else {
            if target > arr[l] {
                return -1
            }
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
        return l
    }
}
