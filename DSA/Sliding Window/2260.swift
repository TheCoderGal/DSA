//
//  Untitled.swift
//  DSA
//
//  Created by Rohini Vaidya on 22/07/26.
//

/*
 2260. Minimum Consecutive Cards to Pick Up
 You are given an integer array cards where cards[i] represents the value of the ith card. A pair of cards are matching if the cards have the same value.

 Return the minimum number of consecutive cards you have to pick up to have a pair of matching cards among the picked cards. If it is impossible to have matching cards, return -1.
 */

class Solution2260 {
    func minimumCardPickup(_ cards: [Int]) -> Int {
        var r = 0
        var l = 0
        var minLen = cards.count
        var hashMap = [Int: Int]()
        while r < cards.count {
            if let index = hashMap[cards[r]] {
                minLen = min((r-index), minLen)
                hashMap[cards[r]] = r
                l += 1
            } else {
                hashMap[cards[r]] = r
            }
            
            r += 1
        }
        return minLen == cards.count ? -1 : (minLen+1)
    }
}
