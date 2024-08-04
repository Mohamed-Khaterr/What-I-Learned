# Combine
![Combine](https://miro.medium.com/v2/resize:fit:1200/1*BC0gFud8cmz1rKh27pKx7g.png)
Combine was introduced as a new framework by Apple at WWDC 2019. Combine allow us to write Functional Reactive code, Which means we can process values over time, These values can represent any kind of asynchronous events. for Example Networking, UI Events (Button pressed, text in TextField changes, etc), Notification Center, etc.
> Combine is built of Observer Design Pattern

- [WWDC 2019 - Introducing Combine](https://developer.apple.com/videos/play/wwdc2019/722/)
- [WWDC 2019 - Combine in Practice](https://developer.apple.com/videos/play/wwdc2019/721/)

<!-------------------------------------------------------------------------------------------------->
# Table of Content
- [What is Functional Reactive Programming (FRP)](#what-is-functional-reactive-programming-frp)
- [Combine Core Concepts](#combine-core-concepts)
- [Reference](#reference)
- [Words Meaning](#words-meaning)

<!-------------------------------------------------------------------------------------------------->
# Reference
- [WWDC 2019 - Introducing Combine](https://developer.apple.com/videos/play/wwdc2019/722/)
- [WWDC 2019 - Combine in Practice](https://developer.apple.com/videos/play/wwdc2019/721/)
- [Using Combine](https://heckj.github.io/swiftui-notes/)
- [Functional Reactive Programming (FRP)](https://flexiple.com/ios/functional-reactive-programming-using-swift/)
- [Getting started with the Combine framework in Swift](https://www.avanderlee.com/swift/combine/)
- [RxJS Marbles](https://rxmarbles.com/)
- [Getting Started with Combine - Shai Mishali](https://www.youtube.com/watch?v=R7KgBgvQJ0c)

# Words Meaning
- Consumers -> Any one want listen to changes
- emit -> أرسل | ينبعث

<!-------------------------------------------------------------------------------------------------->
# What is Functional Reactive Programming (FRP)
![free code camp](https://cdn-media-1.freecodecamp.org/images/zmvecVovUlqx5GTj1gMqLVhLKHEiES7Fy42x)

Functional Reactive Programming (FRP), also known as data-flow programming, Which is stream of events in *asynchronous* way, and it allows us to process values over stream events. Look at next code example to understand.
```swift
// This block of code represent Imperative Programming
// Imperative Programming is traditional way to write code
var balance = 10
let productPrice = 50

let canMakePurchase = balance >= productPrice
print(canMakePurchase) // Output: false

balance += 50
print(canMakePurchase) // Output: false
```
In above code, We see that `canMakePurchase` variable depend on `balance` and `productPrice` but if we try to update the `balance` and try to print the `canMakePurchase` again it doesn't change, So it doesn't reflect the latest state of `balance`.

```swift
// This block of code represent Functional Reactive Programming
var balance = 10
let productPrice = 50

let canMakePurchase = productPrice
                        .combineLatest(balance) // Combine the values
                        .map{ $0 >= $1 } // Process the value

print(canMakePurchase) // Output: false

balance += 50
print(canMakePurchase) // Output: true
```
Now `canMakePurchase` always reflect the latest state means that if `balance` changes or in future we make `productPrice` **var** not **let** and change it's value the `canMakePurchase` will always change.

So in *Functional Reactive Programming (FRP)* we have stream of events and process values of these events over time.

These stream events in iOS world can be represent as Network Responses, NotificationCenter and user interface events or any other types of asynchronous data.

So this is the idea of how Combine works.

> You can read more about Functional Reactive Programming (FRP) from this [link](https://flexiple.com/ios/functional-reactive-programming-using-swift/) or this [link](https://www.freecodecamp.org/news/functional-reactive-programming-frp-imperative-vs-declarative-vs-reactive-style-84878272c77f/).

<!-------------------------------------------------------------------------------------------------->
# Combine Core Concepts
There are only three concepts in Combine, they form the foundation of Combine and enable you to send and receive data, typically asynchronously.
- Publisher
    -
    A type that can emit a sequence of values over time and the subscribers will handle these emits. You can think of a publisher as kind of like `NotificationCenter` it Publish data and there are listeners (observers).
    > In fact, NotificationCenter now has a method named `publisher(for:object:)` that provides a Publisher type that can publish broadcasted notifications.

    Publisher is ***Value type***

    Publishers can emit 3 types of events:
    - Value
    - Completion
        - Finished Completion
        - Failure Completion with error
- Subscriber
    - 
    A listener that listen to the Publisher emits. So Subscribers receives values and a Completion from Publisher each time.
    
    Subscriber is ***Reference type***.
- Operators
    -
    A behavior for changing values of Publisher, for example `.map` is Operator to change a value of Publisher.

    Operator is ***Value type***

# Back pressure
Combine is designed such that the subscriber controls the flow of data, and because of that it also controls what and when processing happens in the pipeline. This is a feature of Combine called back-pressure.
