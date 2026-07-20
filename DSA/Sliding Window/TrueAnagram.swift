//
//  TrueAnagram.swift
//  DSA
//
//  Created by Rohini Vaidya on 10/07/26.
//
/* Given two strings s and t, return true if t is an anagram of s, and false otherwise.

 

Example 1:

Input: s = "anagram", t = "nagaram"

Output: true
*/


class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        
        guard s.count == t.count else {
            return false
        }

        var freq = Array(repeating: 0, count: 26)
        for byte in s.utf8 {
            let index = Int(byte - 97)
            freq[index] += 1
        }

        for byte in t.utf8 {
            let index = Int(byte - 97)
            freq[index] -= 1
        }

        return freq.allSatisfy({$0 == 0})

    }
    
    func isAnagram2(_ s: String, _ t: String) -> Bool {
        
        guard s.count == t.count else {
            return false
        }
        
        var freq = Array(repeating: 0, count: 26)
        for char in s {
            let index = Int(char.asciiValue! - 97)
            freq[index] += 1
            
        }
        
        for char in t {
            let index = Int(char.asciiValue! - 97)
            freq[index] -= 1
        }
        
        return freq.allSatisfy({$0 == 0})
    }
}
