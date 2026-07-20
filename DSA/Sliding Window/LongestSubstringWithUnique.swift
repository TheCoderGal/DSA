//
//  LongestSubstringWithUnique.swift
//  DSA
//
//  Created by Rohini Vaidya on 10/07/26.
//

extension Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var max_length = 0
        var hashset = Set<String>()

        var r = 0
        var l = 0
        var arrayS = Array(s)
        while r < s.count {

            while hashset.contains(String(arrayS[r])) {
                l += 1
                hashset.remove(String(arrayS[l]))
            }
            hashset.insert(String(arrayS[r]))
            max_length = max(max_length, r-l+1)
            r += 1
        }

        return max_length
    }
}
