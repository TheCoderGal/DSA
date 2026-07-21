//
//  1524.swift
//  DSA
//
//  Created by Rohini Vaidya on 20/07/26.
//

/*
 Number of Sub-arrays With Odd Sum
 Given an array of integers arr, return the number of subarrays with an odd sum.

 Since the answer can be very large, return it modulo 109 + 7.

  

 Example 1:

 Input: arr = [1,3,5]
 Output: 4
 Explanation: All subarrays are [[1],[1,3],[1,3,5],[3],[3,5],[5]]
 All sub-arrays sum are [1,4,9,3,8,5].
 Odd sums are [1,9,3,5] so the answer is 4.
 */

class Solution1524 {
    
    func numOfSubarrays(_ arr: [Int]) -> Int {
        
            var count = 0
            
            let hasOdd = arr.contains { $0 % 2 != 0 }
            if !hasOdd { return 0 }
            
            for i in 0..<arr.count {
                var sum = 0
                for j in i..<arr.count {
                    sum += arr[j]  // Accumulate sum
                    if sum % 2 != 0 {
                        count += 1
                    }
                }
            }
            
            
            return count
    }
    
}
