//
//  34.swift
//  DSA
//
//  Created by Rohini Vaidya on 27/07/26.
//

class FindirstAndLastOccurance {
    
    //BF - O(n)
//    func findFirstAndLastOccurance(_ nums: [Int], _ target: Int) -> [Int] {
//        
//        var result = [-1, -1]
//        // Brute force
//        var didFind = false
//        var r = nums.count - 1
//        var l = 0
//        
//        while l < r {
//            
//            if nums[l] == target {
//                
//                if !didFind {
//                    didFind = true
//                    result.removeAll()
//                }
//                result.append(l)
//            }
//            
//            if nums[r] == target {
//                if !didFind {
//                    didFind = true
//                    result.removeAll()
//                }
//                result.append(r)
//            }
//            
//            l += 1
//            r -= 1
//        }
//        
//        return result.sorted()
//    }
    
    // O(log n)
    func findFirstAndLastOccurance(_ nums: [Int], _ target: Int) -> [Int]{
        
        var result = [Int]()
        let first = search(nums, target, true)
        let last = search(nums, target, false)
        
        result.append(first)
        result.append(last)
        return result
        
    }
    
    func search(_ nums: [Int], _ target: Int, _ isFirst: Bool) -> Int {
        var l = 0
        var r = nums.count - 1
        var ans = -1
        while l <= r {
            var mid = l + (r-l)/2
            
            if target < nums[mid] {
                r = mid-1
                
            } else if target > nums[mid] {
                 l = mid + 1
            } else {
                ans = mid
                if isFirst {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
        }
        return ans
        
    }
    
}

