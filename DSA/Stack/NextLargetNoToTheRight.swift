//
//  NextLargetNoToTheRight.swift
//  DSA
//
//  Created by Rohini Vaidya on 06/10/26.
//

import Foundation

class NextLargetNoToTheRight {
    func replaceElements(_ arr: [Int]) -> [Int] {

        var stack = [Int]()
        var res = Array(repeating: 0, count: arr.count)

        for i in arr.indices.reversed() {
            print("arr[i] \(arr[i])")
            while !stack.isEmpty, let last = stack.last, last <= arr[i]  {
                print("last \(last)")
                stack.removeLast()
            }
            print("stack \(stack)")
            if !stack.isEmpty, let last = stack.last {
                res[i] = last
            } else {
                res[i] = -1
            }
            print("res[i] \(res)")

            stack.append(arr[i])
            print("stack \(stack)")
        }
        return res
    }
}
