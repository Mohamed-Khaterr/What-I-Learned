# SwiftUI

- `@State` are value type, They hold a memory address of the variable *(to update the variable without re-instantiate the struct)*.

```swift
@State var isAppear = false
```

- `@Binding` ara value type, used to bind with `@State` properties *(aka passing by reference)* and is mostly used when we want to change something in the previous View.

```swift
struct A {
    // Value of isAppear only changes inside the A struct
    @State var isAppear = false

    func bind() {
        // aka passing by reference
        B(isAppear: self.$isAppear)
    }
}

struct B {
    @Binding var isAppear: Bool
}
```

# Declarative vs. Imperative
