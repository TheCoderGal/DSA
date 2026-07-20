//
//  LongestSubstringRepeatedChars.swift
//  DSA
//
//  Created by Rohini Vaidya on 11/07/26.
//

func characterReplacement(_ s: String, _ k: Int) -> Int {
    var r = 0
    var l = 0
    var max_len = 0
    var highest_freq = 0
    
    var hashmap = [String: Int]()
    var array_s = Array(s)
    while r < s.count {
        let char_r = String(array_s[r])
        let char_l = String(array_s[l])
        hashmap[char_r, default: 0] += 1
        if let newFreq = hashmap[char_r] {
            highest_freq = max(highest_freq, newFreq)
        }
        
        let uniqueCount = (r-l+1) - highest_freq
        while (r - l + 1) - highest_freq > k {
            let char_l = String(array_s[l])
            hashmap[char_l]! -= 1
            l += 1
        }

        max_len = max(max_len, r - l + 1)
        r += 1
    }
    
    return max_len
}
