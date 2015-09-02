//
//  JWArrayExtensions.swift
//  JWSwiftArrayExtensions
//
//  Created by Jacky Wang on 9/2/15.
//  Copyright (c) 2015 Jacky Wang. All rights reserved.
//

import Foundation

extension Array {
    
    mutating func removeObject<T : Equatable>(object: T) {
        var index: Int?
        for (i, objectInArray) in enumerate(self) {
            if let objectInArray = objectInArray as? T {
                if object == objectInArray {
                    removeAtIndex(i)
                }
            }
        }
    }
    
    mutating func shuffle() {
        
        var resultArray = [T]()
        let originalCount = count
        
        for i in 0..<originalCount {
            let randomIndex = Int(arc4random_uniform(UInt32(count)))
            resultArray.append(removeAtIndex(randomIndex))
        }
        
        self = resultArray
    }
    
    mutating func moveObjectToIndex<T : Equatable>(object: T, index: Int) {
        
        for (i, value) in enumerate(self) {
            if let value = value as? T {
                if value == object {
                    insert(removeAtIndex(i), atIndex: index)
                }
            }
        }
    }
    
    mutating func moveObjectToFront<T: Equatable>(object: T) {
        moveObjectToIndex(object, index: 0)
    }
    
    mutating func moveObjectToLast<T: Equatable>(object: T) {
        moveObjectToIndex(object, index: count - 1)
    }
}