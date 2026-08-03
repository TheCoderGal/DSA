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
    
    //BF O(n2)
    /*
     Compute the subarrays and check sum
     */
//    func numOfSubarrays(_ arr: [Int]) -> Int {
//        
//        var count = 0
//        
//        var allEven = true
//        arr.filter({$0%2 != 0}).count > 0 ? (allEven = false) : (allEven = true)
//        if allEven {
//            return 0
//        }
//        
//        for l in 0..<arr.count {
//            var sum = 0
//            for r in l..<arr.count {
//                sum += arr[r]
//                if sum%2 != 0 {
//                    count += 1
//                }
//                
//            }
//        }
//        
//        return count
//    }
    
    //Optimal O(n)
    /*
     If we observe:
     ex: [1,3, 5]
     ps = [1, 4, 9]
     
     ex2: Input: arr = [1,2,3,4,5,6,7]
     ps = [1, 3, 6, 10, 15, 21, 28 ]
     
     if the 2 ps values are opp, odd and evn and vice versa, the diff = odd. Hence the subarray is valid.
     
     so in one go, go on computing ps, and keep a count if ps%2 == 0, increment evensum and vice versa. if ps%2 == 0, then the result = oddSum + ps[i], else evensum + ps[i]
     
     return the result
     */
    
    func numOfSubarrays(_ arr: [Int]) -> Int {
        
        var ps = 0
        var noOfEvenSums = 1 // ps is 0, which is even
        var noOSOddSums = 0
        var result = 0
        
        //since in question its asked to give as mod of 10pow9 + 7
        
        var mod = 1_000_000_0007
        for num in arr {
            ps += num
            
            if ps%2 == 0 {
                noOfEvenSums += 1
                result += noOSOddSums
            } else {
                noOSOddSums += 1
                result += noOfEvenSums
            }
        }
        
        return result % mod
    }
    
}
