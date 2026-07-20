//
//  CountAnagrams.swift
//  DSA
//
//  Created by Rohini Vaidya on 10/07/26.
//
 
/*
  Given 2 strings s and t, find the no of anagrams of t in s.
  anagram of t is same set of continuous letters/substring in s that is not worried of the order of letters in the substring
*/

/*
 
 THOUGHT PROCESS. Since t is the window we need to search for in s, only with the freq of chars and not order, but len is fixed. So we need to start from 0 and expand it to the len of t and then slide it till the end and test if each window satifsies the freq of chars of t. Hence algo is FIXED SLIDING WINDOW.
 
 Tools: asciiValue is the built in swift fn that can be used to compute the index of the letters. Make 2 arrays with the freq of chars both of len 26 and compare in each window.
 To progress the window, increase l and r. while setting the freq of l char in the current wondow to 0 everytime the window len is achieved and condition is satisfied.
 
 */

class SlidingWindow {
    
    func countAnagrams(_ s: String, _ t: String) -> Int {
        
        var count = 0
        guard s.count >= t.count else { return 0 }
        
        var t_freq: [Int] = Array(repeating: 0, count: 26)
        var current_window_freq: [Int] = Array(repeating: 0, count: 26)
        
        for char in t {
            let index = Int(char.asciiValue! - 97)
            t_freq[index] += 1
        }
        
        var l = 0
        var r = 0
        var sArray: [Character] = Array(s)
        while r < s.count {
            let index = Int(sArray[r].asciiValue! - 97)
            current_window_freq[index] += 1
            
            if r - l + 1 == t.count {
                if current_window_freq == t_freq {
                    count += 1
                }
                
                let index_l = Int(sArray[l].asciiValue! - 97)
                current_window_freq[index_l] -= 1
                l += 1
            }
            r += 1
        }
        return count
    }
}
