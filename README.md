# UserDefaultsTypeSafeKey
#### 利用Swift类型推断构思UserDefaults的Key和Value

```
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

```

#### 创建key 
```
extension UserDefaults.Key where Value == Int {
    static let ageKey = Self("ageKey")
}

extension UserDefaults.Key where Value == Bool {
    static let okKey = Self("okKey")
}
```
#### 使用方法
```
UserDefaults.standard.setValue(1, forKey: .ageKey)
let age = UserDefaults.standard.value(forKey: .ageKey) // 类型推断Int?

UserDefaults.standard.setValue(false, forKey: .okKey)
let isOk = UserDefaults.standard.value(forKey: .okKey) // 类型推断Bool?

print(age, isOk)

```

[构思灵感来源](https://danieltull.co.uk//blog/2019/10/09/type-safe-user-defaults/)
