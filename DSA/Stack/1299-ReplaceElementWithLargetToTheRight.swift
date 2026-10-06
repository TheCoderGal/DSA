//
//  1299-ReplaceElementWithLargetToTheRight.swift
//  DSA
//
//  Created by Rohini Vaidya on 06/10/26.
//

import Foundation

class ReplaceElementWithLargestTotheRight {
    func replaceElements(_ arr: [Int]) -> [Int] {

        var maxRight = -1
        var res = Array(repeating: 0, count: arr.count)

        for i in arr.indices.reversed() {
            res[i] = maxRight
            maxRight = max(maxRight, arr[i])
        }
       return res
    }
}
