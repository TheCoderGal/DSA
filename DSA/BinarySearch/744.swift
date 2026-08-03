//
//  744.swift
//  DSA
//
//  Created by Rohini Vaidya on 27/07/26.
//
// https://leetcode.com/problems/find-smallest-letter-greater-than-target/description/

func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
    
    var l = 0
    var n = letters.count
    var r = n-1
    
    while l <= r {
        var mid = l + (r-l)/29
        
        if target < letters[mid] {
            r = mid-1
        } else {
            l = mid + 1
        }
        
    }
    
    return letters[l%n]
}
