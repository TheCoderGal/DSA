//
//  SearchInSorted2DMatrix.swift
//  DSA
//
//  Created by Rohini Vaidya on 02/10/26.
//

class SearchInSorted2DMatrix {
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var rows = matrix.count
        var cols = rows > 0 ? matrix[0].count : 0
        var rStart = 0
        var rEnd = rows-1
        var cStart = 0
        var cEnd = cols-1
        let cMid = cols/2
        
        //Run this until there are only 2 rows
        while rStart < (rEnd-1) {
            let rMid = rStart + (rEnd-rStart)/2
            if matrix[rMid][cMid] ==  target {
                return true
            }
            
            if target < matrix[rMid][cMid] {
                rEnd = rMid
            } else {
                rStart = rMid
            }
        }
        
        //check in the remaining 2 rows
        
        
        if binarySearch(row: rStart, cStart: cStart, cEnd: cEnd, target: target, a: matrix) {
            return true
        }
        
        if rEnd != rStart && binarySearch(row: rEnd, cStart: cStart, cEnd: cEnd, target: target, a: matrix) {
            return true
        }
        
       
        
        return false
    }
    
    func binarySearch(row: Int, cStart: Int, cEnd: Int, target: Int, a: [[Int]]) -> Bool {
        var start = cStart
        var end = cEnd
        
        while start <= end {
            let mid = start + (end-start)/2
            
            if a[row][mid] == target {
                return true
            }
            
            if target > a[row][mid] {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        
        return false
    }
    
    
}
