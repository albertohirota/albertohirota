//
//  Extension.swift
//  Pontos
//
//  Created by Alberto Hirota on 2016-09-02.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import Foundation

extension Array where Element:Equatable {
    func removeDuplicates() -> [Element] {
        var result = [Element]()
        
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        return result
    }
}
