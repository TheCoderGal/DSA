//
//  3.swift
//  DSA
//
//  Created by Rohini Vaidya on 22/07/26.
//

/*
 
 3. Longest Substring Without Repeating Characters
 Given a string s, find the length of the longest substring without duplicate characters.

 */

class Solution3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
         var max_length = 0
        var hashset = Set<String>()

        var r = 0
        var l = 0
        var arrayS = Array(s)
        while r < s.count {

            while hashset.contains(String(arrayS[r])) {
                hashset.remove(String(arrayS[l]))
                l += 1
            }
            max_length = max(max_length, r-l+1)
            hashset.insert(String(arrayS[r]))

            r += 1
        }

        return max_length

    }
}
