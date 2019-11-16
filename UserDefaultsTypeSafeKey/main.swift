//
//  main.swift
//  UserDefaultsTypeSafeKey
//
//  Created by chunxi on 2019/11/16.
//  Copyright © 2019 chunxi. All rights reserved.
//

import Foundation

UserDefaults.standard.setValue(1, forKey: .ageKey)
let age = UserDefaults.standard.value(forKey: .ageKey)

UserDefaults.standard.setValue(false, forKey: .okKey)
let isOk = UserDefaults.standard.value(forKey: .okKey)

print(age, isOk)
