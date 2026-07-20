//
//  3652.swift
//  DSA
//
//  Created by Rohini Vaidya on 20/07/26.
//

class SlidingWindow4 {
    func maxProfit(_ prices: [Int], _ strategy: [Int], _ k: Int) -> Int {
        var maxProfit = 0
        for price in prices {
            for strat in strategy {
                maxProfit += (price * strat)
            }
        }
        
        var r = 0
        var l = 0
        var count = 0
        var sum = 0
        while r < prices.count {
            sum += prices[r]
            if (r-l+1) == k {
                if count == k/2 {
                    
                    count = 0
                }
                l += 1
            } else {
                sum -= prices[l+count]
            }
            count += 1
            r += 1
        }
        
        return maxProfit
    }
}
