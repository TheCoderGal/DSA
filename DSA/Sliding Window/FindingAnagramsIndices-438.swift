//
//  FindingAnagramsIndices.swift
//  DSA
//
//  Created by Rohini Vaidya on 17/07/26.
//

class SlidingWindow3 {
    
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
            var hashSet = Set<Int>()
            var pMap = [Character: Int]()
            var sMap = [Character: Int]()

            var r = 0
            var l = 0

            var n = p.count
            var pArray = Array(p)
            for (i, char) in pArray.enumerated() {
                pMap[char, default: 0] += 1
            }

            var sArray = Array(p)
            while r < n {
                sMap[sArray[r], default: 0] += 1
                if (r-l+1) == n {
                    if pMap == sMap {
                        hashSet.insert(r)
                    }
                    if let count = sMap[sArray[l]] {
                        if count == 0 {
                            sMap[sArray[l]] = nil
                        } else {
                            sMap[sArray[l]] = count - 1
                        }
                    }
                    l += 1
                }

                r += 1
            }
            
            return Array(hashSet)
        }
    
}
