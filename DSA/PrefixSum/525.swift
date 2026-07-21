//
//  525.swift
//  DSA
//
//  Created by Rohini Vaidya on 21/07/26.
//

/*
 Contiguous array
 
 Given a binary array nums, return the maximum length of a contiguous subarray with an equal number of 0 and 1.
 */

class ContiguousArray {
    
    //BF
    /*
     I simply get all sub arrays in O(n2) and then process the noOf 0s and 1s and get maxLen of the window/subarray
     */
//    func findMaxLength(_ nums: [Int]) -> Int {
//        
//        var maxLen = 0
//        
//        for l in 0..<nums.count {
//            var zeros = 0
//            var ones = 0
//            for r in l..<nums.count {
//                nums[r] == 0 ? (zeros += 1) : (ones += 1)
//                if zeros == ones {
//                    maxLen = max(maxLen, (r-l+1))
//                }
//            }
//        }
//        
//        return maxLen
//        
//    }
    
    /*
     Optimal O(n) solution
     
     We are talking about subarrays. But since there is no way to shrink the dynamic window, we can't use the sliding window pattern.
     So, we are lloking at other patterns.
     Thought: It says, return the maxLen window that has equal no of 0s and 1s. Meaning, if we make one of them the negative of other, then sum world be 0. Then the problem will reduce to finding largest subarray that sums to 0.
     
     So, assign -1 to 0 and compute.
     So, inorder to not repeat twice,as you feed prefixSum array, add each sum and its index to the hashmap. So that everytime you get a sum, check if there is its index, get the difference btw the indices and update maxLen.
     */
    
    func findMaxLength(_ nums: [Int]) -> Int {
        
        var maxLen = 0
        
        var prefixSum = 0
        var hashMap: [Int: Int] = [0: -1]
        for i in 0..<nums.count {
            if nums[i] == 0 {
                     prefixSum -= 1
                 } else {
                     prefixSum += 1
                 }
            if let index = hashMap[prefixSum] {
                maxLen = max(maxLen, (i - index))
            } else {
                hashMap[prefixSum] = i
            }
        }
        
        return maxLen
    }
}
