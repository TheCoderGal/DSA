//
//  2461.swift
//  DSA
//
//  Created by Rohini Vaidya on 14/07/26.
//

class SlidingWindow2 {
    //BruteForce

    func maximumSubarraySumBF(_ nums: [Int], _ k : Int) -> Int {
        
        var maxSum = 0
        
        for i in 0..<nums.count {
            var sum = 0
            var set = Set<Int>()
            for j in i..<k {
                if !set.contains(nums[j]) {
                    set.insert(nums[j])
                    sum += nums[j]
                }
            }
            print("Set \(set)")
            maxSum = max(maxSum, sum)
        }
        print("\(maxSum)")
        return maxSum
    }

    func maximumSubarraySum(_ nums: [Int], _ k : Int) -> Int {
        var l = 0
        var r = 0
        var maxSum = 0
        
        var set = Set<Int>()
        var sum = 0
        
        while r < nums.count {
            if (r - l + 1) == k {
                if !set.contains(nums[l]) {
                    set.insert(nums[l])
                    sum += nums[l]
                }
                l += 1
           
            } else {
                r += 1
                maxSum = max(maxSum, sum)
                sum = 0
            }
           
        }
        return maxSum
    }
   

}
