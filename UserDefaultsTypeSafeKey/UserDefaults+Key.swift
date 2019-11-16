//
//  UserDefaults+Key.swift
//  UserDefaultKey
//
//  Created by chunxi on 2019/11/16.
//  Copyright © 2019 chunxi. All rights reserved.
//

import Foundation

// 类型推断的UserDefaults
extension UserDefaults {
    
    struct Key<Value> {
        let key: String
        init(_ key: String) {
            self.key = key
        }
    }
    
    func setValue<Value>(_ value: Value?, forKey key: Key<Value>) {
        setValue(value, forKey: key.key)
    }
    
    func value<Value>(forKey key: Key<Value>) -> Value? {
        if let v = value(forKey: key.key) as? Value {
            return v
        }
        return nil
    }
}


extension UserDefaults.Key where Value == Int {
    static let ageKey = Self("ageKey")
}


extension UserDefaults.Key where Value == Bool {
    static let okKey = Self("okKey")
}
