//
//  524.swift
//  DSA
//
//  Created by Rohini Vaidya on 22/07/26.
//

/*
 You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times.

 Return the length of the longest substring containing the same letter you can get after performing the above operations.

  

 Example 1:

 Input: s = "ABAB", k = 2
 Output: 4
 Explanation: Replace the two 'A's with two 'B's or vice versa.
 Example 2:

 Input: s = "AABABBA", k = 1
 Output: 4
 Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
 The substring "BBBB" has the longest repeating letters, which is 4.
 There may exists other ways to achieve this answer too.
 */

class Solution524 {
    
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var maxLen = 0
        let sArray = Array(s)
        var hashmap: [Character: Int] = [:]
        var highestFreqCharCount = 0
        for l in 0..<s.count {
            for r in l..<s.count {
                hashmap[sArray[r], default: 0] += 1
                
                if let count = hashmap[sArray[r]] {
                    highestFreqCharCount = max(highestFreqCharCount, count)
                }
                let uniqueSubstringCharCount = (r-l+1) - highestFreqCharCount
                
                
                if uniqueSubstringCharCount <= k {
                    maxLen = max(maxLen, (r-l+1))
                }
                
            }
        }
        
        return maxLen
    }
    
//    func characterReplacement(_ s: String, _ k: Int) -> Int {
//        var maxLen = 0
//        let sArray = Array(s)
//        var highest_freq = 0
//        var r = 0
//        var l = 0
//        var hashmap: [Character: Int] = [:]
//        while r < s.count {
//            hashmap[sArray[r], default: 0] += 1
//
//            if let index = hashmap[sArray[r]] {
//                highest_freq = max(highest_freq, index)
//            }
//            
//            let uniqueSubstringLen = (r-l+1) - highest_freq
//            
//            if uniqueSubstringLen > k {
//                if let index = hashmap[sArray[l]] {
//                    hashmap[sArray[l]] = index - 1
//                }
//                l += 1
//            }
//            maxLen = max(maxLen, r - l + 1)
//
//            r += 1
//        }
//        
//        return maxLen
//    }
}
