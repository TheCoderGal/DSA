//
//  Solution.swift
//  DSA
//
//  Created by Rohini Vaidya on 06/10/26.
//


class ValidParanthesis {
    func isValid(_ s: String) -> Bool {
        let hashMap = ["{" : "}", "[" : "]", "(" : ")"]
        var stack: String = ""
        for c in s {
            //to see if the c in s is from hashmap keys and, then check the stack.last and if there pop. Else, add the c to stack. If the match doesnt happen, return false
            
            //finally is stack is empty, return true else false
            
            
            if hashMap.keys.contains(String(c)) {
                stack.append(c)
            } else  {
                guard let last = stack.last else {
                    return false
                }
                
                if hashMap[String(last)] == String(c) {
                    stack.removeLast()
                } else {
                    return false
                }
            }
            
        }
            
        return stack.isEmpty ? true : false
        
    }
}
